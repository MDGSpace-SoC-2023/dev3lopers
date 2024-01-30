// requirements.js
const mongoose = require('mongoose');
const { Schema } = mongoose;

// Writing Schema for requirements of project
const reqSchema = new Schema({
    branch: {
        type: String,
    },
    year: {
        type: String,
    },
    skills: {
        type: [String],
        required: true,
    },
    cgpa: {
        type: String,
    },
});

module.exports = reqSchema; // Export the schema, not the model

