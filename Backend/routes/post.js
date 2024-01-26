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
        const { title, description, requirements } = req.body;
        // let userId = req.user._id;
        const userId = req.user.id;
        const user = await User.findById(req.user.id);
                if (!user) {
                    return res.status(404).json({ error: 'User not found' });
                }

        const newProject = new Project({
            userId,
            title,
            description,
            requirements,
        });

        const savedProject = await newProject.save();
        res.json({ success: true, message: 'Project created successfully', project: savedProject });
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
        if (req.user.id !== (userPost.user._id ? userPost.user._id.toString() : null)) {
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
            description
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
            return res.json({ 'projects': 'No projects were' });
        }

        // Send the list of projects to the client
        res.json({ projects: projects });
    } catch (error) {
        console.error(error.message);
        res.status(500).send("Some error in server");
    }
})

module.exports = router;
