var express = require('express');
var router = express.Router();
var jwt = require('jsonwebtoken');
const {body,validationResult} = require('express-validator');
const User = require('../models/user');
const bcrypt = require('bcrypt');
// const jwt_secret = process.env.JWT_SECRET
const jwt_secret = "fast is fast";
const fetchUser = require('../middlewares/fetchUser')
/* GET users listing. */

router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});


//route for registration
router.post('/registeruser',[
  body('name','Enter a valid name').isLength({min:3}),
  body('email','Enter valid email').isEmail(),
  body('password','Password must contain atleast 6 characters').isLength({min:6})
],async (req,res)=>{
const errors = validationResult(req);
if(!errors.isEmpty()){
  return res.status(400).json({errors:errors.array()})
}
try{
  let user = await User.findOne({email:req.body.email});
  if(user){
    return res.status(500).json({error:"sorry,This email user already exits"})
  }
  const my_password = req.body.password;
  const saltRounds = 10;
  
  bcrypt.hash(my_password,saltRounds, async(err,hash)=>{
    if(err){
      console.error("Error while hashing password:", err);
      return res.status(500).send("pasword hash error");
    }
     // Now, 'hash' contains the hashed password
      user = await User.create({
        name:req.body.name,
        enrollmentNumber:req.body.enrollmentNumber,
        role:req.body.role,
        email:req.body.email,
        password:hash,
      });

    const data = {
      user:{
        id:user.id
      }
    }
    const authToken = jwt.sign(data,jwt_secret);
console.log(authToken);
res.json({authToken});
    
  })

}
catch (error) {
  console.error(error.message);
  res.status(500).send("Some error occurred");
}
})



//route for login

router.post('/login',[
  body('email','Enter valid email').isEmail(),
  body('password','Password cannot be empty').exists()
], async (req,res)=>{
  const errors = validationResult(req);
  if(!errors.isEmpty()){
    return res.status(400).json({errors:errors.array()});
  }
  const {email,password} = req.body;
  try{
    let user = await User.findOne({email});
    if(!user){
      return res.status(400).json({error:"user doesnot exist"})
    }
    const passwordCompare = await bcrypt.compare(password,user.password);
    if(!passwordCompare){
      return res.status(400).json({error:"password is incorrect"});
    }
    const data = {
      id:user.id
    }
    const authToken = jwt.sign(data,jwt_secret);
    res.json({authToken});

  }catch(error){
      console.error(error.message);
  }
})


// route for getting user details
router.post('/getuser', fetchUser,async(req,res)=>{
  try{
 const userId = req.user.id;
 console.log(userId);
const user = await User.findById(userId);
    res.json({verfied:true,user});
  }catch(error){
    console.error(error.message);
   // return res.status(500).json({error:"some internal server error occured "})
  }
})
module.exports = router;
