var express = require('express');
var router = express.Router();
const Project = require('../models/project');
const Requirements = require('../models/requirements');
const fetchUser = require('../middlewares/fetchUser');
const User = require('../models/user');


// POST endpoint to create requirements
// router.post('/requirements', async (req, res) => {
//     try {
//         const { branch, year, skills, cgpa } = req.body;

//         const newRequirements = new Requirements({
//             branch,
//             year,
//             skills,
//             cgpa
//         });

//         const savedRequirements = await newRequirements.save();

//         res.status(201).json({ requirements: savedRequirements });
//     } catch (error) {
//         console.error('Error adding requirements:', error);
//         res.status(500).json({ error: 'Internal Server Error' });
//     }
// });



router.post('/professor/addpost', fetchUser, async (req, res) => {
    try {
        const { title, description, requirements } = req.body;

        if (req.user.role) {
            return res.status(403).json({ error: 'Permission denied. Only professors can post projects.' });
        }

        const professor = await User.findById(req.user.id);
        if (!professor) {
            return res.status(404).json({ error: 'User not found' });
        }

        // Initialize projects as an array if not already defined
        if (!professor.projects) {
            professor.projects = [];
        }

        // Check if requirementsId is provided
        // if (!requirementsId) {
        //     return res.status(400).json({ error: 'Requirements ID is required' });
        // }

        // Verify that the Requirements document exists
        // const requirements = await Requirements.findById(requirementsId);
        // if (!requirements) {
        //     return res.status(404).json({ error: 'Requirements not found' });
        // }

        const newProject = new Project({
            title,
            description,
            requirements: requirements,  // Assign the ID of the Requirements document
            user: req.user.userId
        });

        const savedProject = await newProject.save();

        professor.projects.push(savedProject._id);
        await professor.save();

        res.json({ success: true, project: savedProject });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

module.exports = router;
