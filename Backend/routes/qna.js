var express = require('express');
var router = express.Router();
const Project = require('../models/project');
const Requirements = require('../models/requirements');
const fetchUser = require('../middlewares/fetchUser');
const User = require('../models/user');
const submitpost = require('../models/sumbitPost');
const Question = require('../models/qnas');
const Ans = require('../models/answer');

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
            userId: req.user.id,
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
        if(!questions || questions.length ===0){
            const allq = await Question.find({});
            res.json(allq);
        }else{
        res.json(questions);
        }
    } catch (error) {
        console.error(error.message);
        res.status(500).send('Server error');
    }
});

router.post('/postans/:id', fetchUser, async (req, res) => {
    try {
        const { answerText, images } = req.body;
        const questionId = req.params.id;
        const answer = new Question({
            questionId,
            userId: req.user.id,
            userName:req.user.name,
            answerText,
            images
        });
        await answer.save();
        res.status(201).json(answer);
    } catch (error) {
        console.error(error.message);
        res.status(500).send('Server error');
    }
});


router.get('/answers/:id', fetchUser, async (req, res) => {
    try {
        const user = await User.findById(req.user.id);
        const questionId = req.params.id;
        if (!user) {
            return res.status(404).json({ error: 'User not found' });
        }

        const answers = await Ans.find({ questionId:questionId });
        res.json(answers);
    } catch (error) {
        console.error(error.message);
        res.status(500).send('Server error');
    }
});


router.get('/myquestions',fetchUser,async (req,res)=>{
    try {
        const userId = req.user.id;

        // Find all projects that have the specified user ID
        const questions = await Question.find({ userId: userId });

        // Check if any projects were found
        if (!questions || questions.length === 0) {
            return res.json({ 'questions': 'No questions were found' });
        }

        // Send the list of projects to the client
        res.json( questions);
    } catch (error) {
        console.error(error.message);
        res.status(500).send("Some error in server");
    }
})







module.exports = router;