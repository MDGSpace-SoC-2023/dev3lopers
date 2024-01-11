const mongoose = require('mongoose');
const reqSchema = require('../models/requirements');
const { Schema } = mongoose;

// Schema for project post
const projSchema = new Schema({
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

module.exports = mongoose.model('Project', projSchema);
