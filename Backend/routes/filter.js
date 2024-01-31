var express = require('express');
var router = express.Router();
const Project = require('../models/project');
const Requirements = require('../models/requirements');
const fetchUser = require('../middlewares/fetchUser');
const User = require('../models/user');
const submitpost = require('../models/sumbitPost');
const Question = require('../models/qnas')

router.get('/filterbydates',async (req,res)=>{
    try {
        const { startDate, endDate } = req.query;

        // Create a filter object
        let filters = {};
        if (startDate || endDate) {
            filters.expiryDate = {};
            if (startDate) {
                filters.expiryDate.$gte = new Date(startDate);
            }
            if (endDate) {
                filters.expiryDate.$lte = new Date(endDate);
            }
        }
        // if (skills) {
        //     filters['requirements.skills'] = { $in: skills.split(',') };
        // }
        

        const posts = await Project.find(filters);
        res.json(posts);
    } catch (error) {
        console.error(error.message);
        res.status(500).send('Server error');
    }
});







module.exports = router;




