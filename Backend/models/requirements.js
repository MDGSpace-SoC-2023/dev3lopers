const mongoose = require('mongoose');
const {Schema}= mongoose;

// writing Schema for requirements of project
const  reqSchema = new Schema({
    branch:{
        type:String,
        required:false
    },
    year:{
        type:Number,
        required:false
    },
    skills:{
        type:[String],
        required:true
    },
    cgpa:{
        type:Number,
        required:false
    }
})

module.exports = mongoose.model('req',reqSchema)  //exporting this schema 