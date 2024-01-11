// requirements.js
const mongoose = require('mongoose');
const { Schema } = mongoose;

// Writing Schema for requirements of project
const reqSchema = new Schema({
    branch: {
        type: String,
    },
    year: {
        type: Number,
    },
    skills: {
        type: [String],
        required: true,
    },
    cgpa: {
        type: Number,
    },
});

module.exports = reqSchema; // Export the schema, not the model

