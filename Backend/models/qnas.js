const mongoose = require('mongoose');
const { Schema } = mongoose;

// Schema for project post
const qaSchema = new Schema({
    userId:{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required:true,
     },
    questionText: {
        type: String,
    },
    pic:{
        type: [String],
    },
    clubs:{
        type:[String],
    },

});

const Qna = mongoose.model('Qna', qaSchema);
module.exports = Qna;