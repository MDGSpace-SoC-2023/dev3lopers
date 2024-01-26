var express = require('express');
var router = express.Router();
const Project = require('../models/project');
const Requirements = require('../models/requirements');
const fetchUser = require('../middlewares/fetchUser');
const User = require('../models/user');
const submitpost = require('../models/sumbitPost');

router.get('/openproposal/:id', async (req,res)=>{
    try {
        const postId = req.params.id;
       const proposals =  await submitpost.find({postId:postId});
    //    const user = await User.findById(req.user.id);
       if (!proposals || proposals.length === 0) {
        return res.json({ 'proposals': 'No proposals were requested' });
    }
    // if(!user){
    //     return res.status(404).json({ error: 'User not found' });
    // }
    res.json({proposals:proposals});


    } catch (error) {
        console.error(error)
        return res.status(500).send("some internal server error")
    }
})





module.exports = router;