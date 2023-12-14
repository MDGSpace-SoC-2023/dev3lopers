const mongoose = require('mongoose');
const reqSchema = require('../models/requirements')
const {Schema}= mongoose;

//Schema for project post
const projSchema = newSchema({
    title:{
        type:String,
        required:true
    },
    description:{
        type:String,
        required:true
    },
    requirements:{
        type:[reqSchema]
    }
});

module.exports = mongoose.model('project',projSchema);  //exporting schema