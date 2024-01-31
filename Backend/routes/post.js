var express = require('express');
var router = express.Router();
const Project = require('../models/project');
const Requirements = require('../models/requirements');
const fetchUser = require('../middlewares/fetchUser');
const User = require('../models/user');
const submitPost = require('../models/sumbitPost');




// router.post('/professor/addpost', fetchUser, async (req, res) => {
//     try {
//         const { title, description, requirements } = req.body;

//         if (req.user.role) {
//             return res.status(403).json({ error: 'Permission denied. Only professors can post projects.' });
//         }

//         const professor = await User.findById(req.user.id);
//         if (!professor) {
//             return res.status(404).json({ error: 'User not found' });
//         }

//         // Initialize projects as an array if not already defined
//         if (!professor.projects) {
//             professor.projects = [];
//         }

//         const newProject = new Project({
//             user: req.user.userId ,
//             title,
//             description,
//             requirements: requirements,  
//         });

//         const savedProject = await newProject.save();

//         professor.projects.push(savedProject._id);
//         await professor.save();

//         res.json({ success: true, project: savedProject });
//     } catch (error) {
//         console.error(error);
//         res.status(500).json({ error: 'Internal Server Error' });
//     }
// });

router.post('/createpost', fetchUser, async (req, res) => {
    try {
        const {  title, description, requirements,expiryDate } = req.body;
        // let userId = req.user._id;
        const userId = req.user.id;
        const role = req.user.role;
        const userName = req.user.name;
        const user = await User.findById(req.user.id);
                if (!user) {
                    return res.status(404).json({ error: 'User not found' });
                }

        const newProject = new Project({
            userName,
           role,
            userId,
            title,
            description,
            requirements,
            expiryDate,
            
        });

        const savedProject = await newProject.save();
        res.json( savedProject._id);
      
    } catch (error) {
        console.error(error.message);
        res.status(500).send('Some error in server');
    }
});



router.delete('/deletepost/:id', fetchUser, async (req, res) => {
    try {
        const postId = req.params.id;
        const userPost = await Project.findById(postId);

        if (!userPost) {
            return res.status(404).send("Not Found");
        }

        // Ensure userPost.user is not null or undefined before accessing toString()
        if (req.user.id !== (userPost.userId ? userPost.userId.toString() : null)) {
            return res.status(401).send("Unauthorized");
        }

        const deletedPost = await Project.findByIdAndDelete(postId);
        res.json({"Done": "successfully deleted", deletedPost});
    } catch (error) {
        console.error(error.message);
        res.status(500).send("Some error in server");
    }
});

router.post('/submitpost/:id',fetchUser,async (req,res)=>{
    try {
        const {description} = req.body;
         const userId = req.user.id;
         const postId = req.params.id;
        const user = await User.findById(req.user.id);
        if (!user) {
            return res.status(404).json({ error: 'User not found' });
        }

        let projDes = await submitPost.create({
            userId,
            postId,
            description,
            isAccepted:req.body.isAccepted
        });
        res.json(projDes);
    } catch (error) {
        console.error(error.message);
        res.status(500).send("Some error in server");
    }
})

router.get('/myproject',fetchUser,async (req,res)=>{
    try {
        const userId = req.user.id;

        // Find all projects that have the specified user ID
        const projects = await Project.find({ userId: userId });

        // Check if any projects were found
        if (!projects || projects.length === 0) {
            return res.json([]);
        }

        // Send the list of projects to the client
        res.json( projects);
    } catch (error) {
        console.error(error.message);
        res.status(500).send("Some error in server");
    }
})

router.get('/appliedproject',fetchUser,async (req,res)=>{
    try {
        const userId = req.user.id;
        // Find all submitPost documents for the given userId
        const submitPosts = await submitPost.find({ userId });
    
        // Extract postIds from submitPosts
        const postIds = submitPosts.map(submitPost => submitPost.postId);
    
        // Find all Project documents with the extracted postIds
        const submittedProjects = await Project.find({ _id: { $in: postIds } });
        if (!submittedProjects || submittedProjects.length === 0) {
            return res.json({ 'projects': 'No projects were found' });
        }
        res.json(submittedProjects);
      } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
      }
})



// router.get('/profproject',async (req,res)=>{
//     try {
//         // const userId = req.user.id;

//         // Find all projects that have the specified user ID
//         const profprojects = await Project.find({ role: true });

//         // Check if any projects were found
//         if (!profprojects || profprojects.length === 0) {
//             return res.json([]);
//         }

//         // Send the list of projects to the client
//         res.json(profprojects);
//     } catch (error) {
//         console.error(error.message);
//         res.status(500).send("Some error in server");
//     }
// })
router.get('/profproject',fetchUser, async (req, res) => {
    try {
      const userId = req.user.id; // Assuming you have a user object attached to the request
  
      // Find all projects that have the specified user ID
      const profprojects = await Project.find({ role: true });
  
      // Check if any projects were found
      if (!profprojects || profprojects.length === 0) {
        return res.json([]);
      }
      
      // Find all submitPost documents for the specified user
      const submitPosts = await submitPost.find({ userId });
  
      // Extract postIds from submitPosts
      const postIds = submitPosts.map(submitPost => submitPost.postId);
     
  console.log(postIds.toString());
      // Create a response object for each project, indicating if it is applied by the user
      const projectsWithAppliedStatus = profprojects.map(project => {
        return {
          ...project.toObject(),
          isApplied: postIds.toString().includes(project._id)
        };
      });
  
      // Send the list of projects with applied status to the client
      res.json(projectsWithAppliedStatus);
    } catch (error) {
      console.error(error.message);
      res.status(500).send("Some error in server");
    }
  });
  

router.get('/userproject',async (req,res)=>{
    try {
        // const userId = req.user.id;

        // Find all projects that have the specified user ID
        const userprojects = await Project.find({ role: false });

        // Check if any projects were found
        if (!userprojects || userprojects.length === 0) {
            return res.json([]);
        }

        // Send the list of projects to the client
        res.json(userprojects);
    } catch (error) {
        console.error(error.message);
        res.status(500).send("Some error in server");
    }
})



module.exports = router;
