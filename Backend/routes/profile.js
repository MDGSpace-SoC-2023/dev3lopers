var express = require('express');
var router = express.Router();
// const Student = require('../models/student');
const Requirements = require('../models/requirements');
const fetchUser = require('../middlewares/fetchUser');
const User = require('../models/user');
const submitPost = require('../models/sumbitPost');

router.put('/saveprofile',fetchUser, async (req,res)=>{
    try {
        const userId = req.user.id;
      const updatedUser = await User.replaceOne({_id:userId},req.body);
      res.send("done");
       
    } catch (error) {
        console.error(error);
    }
})





router.post('/editprofile',fetchUser, async (req,res)=>{
    
})















module.exports = router;