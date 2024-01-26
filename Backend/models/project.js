const mongoose = require('mongoose');
const reqSchema = require('../models/requirements');
const { Schema } = mongoose;

// Schema for project post
const projSchema = new Schema({
    userId:{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required:true,
     },
    title: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: true,
    },
    requirements: {
        type: reqSchema, // Using Req as a subdocument schema
    },
});

const Project = mongoose.model('Project', projSchema);
module.exports = Project;
