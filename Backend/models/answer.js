const mongoose = require('mongoose');
const { Schema } = mongoose;

// Schema for project post
const ansSchema = new Schema({
    questionId:{
        type:mongoose.Schema.Types.ObjectId,
        ref:'Qna',
        required:true
    },
    userId:{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required:true,
     },
     userName:{
        type:String,
        required:true,
     },
    answerText: {
        type: String,
    },
    pic:{
        type: [String],
    },
    clubs:{
        type:[String],
    },
});

const Ans = mongoose.model('Ans', ansSchema);
module.exports = Ans;