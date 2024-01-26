var express = require('express');
var router = express.Router();
const Project = require('../models/project');
const Requirements = require('../models/requirements');
const fetchUser = require('../middlewares/fetchUser');
const User = require('../models/user');
const submitpost = require('../models/sumbitPost');
const Question = require('../models/qnas')

// router.post('/sendq/:parameters', async (req, res) => {
//     try {
//         const receiver = req.params.parameters;
//         let users = await User.find({ engagements: { $in: [receiver] } });

//         // Optional: Perform actions for each user
//         for (let user of users) {
            

//         }

//         res.json({ success: true, message: 'Users found', users: users });
//     } catch (error) {
//         console.error(error.message);
//         res.status(500).send("Some error in server");
//     }
// });

router.post('/postquestion', fetchUser, async (req, res) => {
    try {
        const { questionText, clubs, images } = req.body;
        const question = new Question({
            user: req.user.id,
            questionText,
            clubs,
            images
        });

        await question.save();
        res.status(201).json(question);
    } catch (error) {
        console.error(error.message);
        res.status(500).send('Server error');
    }
});

router.get('/questions', fetchUser, async (req, res) => {
    try {
        const user = await User.findById(req.user.id);
        if (!user) {
            return res.status(404).json({ error: 'User not found' });
        }

        const questions = await Question.find({ clubs: { $in: user.engagements } });
        res.json(questions);
    } catch (error) {
        console.error(error.message);
        res.status(500).send('Server error');
    }
});







module.exports = router;