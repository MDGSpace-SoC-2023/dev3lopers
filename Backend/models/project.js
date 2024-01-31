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
     userName:{
        type: String,
        required:true,
     },
     role:{
        type:Boolean,
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
    expiryDate: {
        type: Date,
    
    },
    createdAt: {      // Date when the post was created
        type: Date,
        default: Date.now
    }
});

projSchema.index({ expiryDate: 1 }, { expireAfterSeconds: 0 });
projSchema.index({ expiryDate: 1 });

const Project = mongoose.model('Project', projSchema);
module.exports = Project;
