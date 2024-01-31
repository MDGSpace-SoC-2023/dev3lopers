var express = require('express');
var router = express.Router();
const Project = require('../models/project');
const Requirements = require('../models/requirements');
const fetchUser = require('../middlewares/fetchUser');
const User = require('../models/user');
const submitpost = require('../models/sumbitPost');
const submitPost = require('../models/sumbitPost');


router.get('/openproposal/:id', async (req,res)=>{
    try {
        const postId = req.params.id;
       const proposals =  await submitpost.find({postId:postId});
    //    const user = await User.findById(req.user.id);
       if (!proposals || proposals.length === 0) {
        return res.json([]);
    }
    // if(!user){
    //     return res.status(404).json({ error: 'User not found' });
    // }
    var proposals_length = proposals.length;
    module.exports = proposals_length;
    res.json(proposals);


    } catch (error) {
        console.error(error)
        return res.status(500).send("some internal server error")
    }
})
router.put('/accept/:id', async (req, res) => {
    try {
      const submitPostId = req.params.id;
  
      // Find the submitPost document with the given submitPostId
      const proposal = await submitPost.findById(submitPostId);
  
      if (!proposal) {
        return res.json({ message: 'Proposal not found' });
      }
  
      // Check if the proposal is already accepted
      if (proposal.isAccepted) {
        return res.json({ message: 'Proposal is already accepted' });
      }
  
      // Update the isAccepted field to true for the specified proposal
      const updatedProposal = await submitPost.findByIdAndUpdate(
        submitPostId,
        { $set: { isAccepted: true } },
        { new: true } // To get the updated document after the update
      );
  
      res.json(updatedProposal);
  
    } catch (error) {
      console.error(error);
      return res.status(500).send("Some internal server error");
    }
  });
router.put('/reject/:id', async (req, res) => {
    try {
      const submitPostId = req.params.id;
  
      // Find the submitPost document with the given submitPostId
      const proposal = await submitPost.findById(submitPostId);
  
      if (!proposal) {
        return res.json({ message: 'Proposal not found' });
      }
  
      // Check if the proposal is already accepted
      if (proposal.isRejected) {
        return res.json({ message: 'Proposal is already Rejected' });
      }
  
      // Update the isAccepted field to true for the specified proposal
      const updatedProposal = await submitPost.findByIdAndUpdate(
        submitPostId,
        { $set: { isRejected: true } },
        { new: true } // To get the updated document after the update
      );
  
      res.json(updatedProposal);
  
    } catch (error) {
      console.error(error);
      return res.status(500).send("Some internal server error");
    }
  });
  
  




module.exports = router;