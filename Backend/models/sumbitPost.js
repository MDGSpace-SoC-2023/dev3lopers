const mongoose = require('mongoose')
const {Schema} = mongoose;

const subSchema = new Schema({
    userId: {
        type: mongoose.Schema.Types.ObjectId, // Reference to User document
        required: true,
        ref: 'User' // Reference to the User model
    },
    postId: {
        type: mongoose.Schema.Types.ObjectId, // Reference to User document
        required: true,
        ref: 'Project' // Reference to the User model
    },

    description :{
        type : String,
    },
    date :{
        type : Date,
       default : Date.now
   },

});

module.exports = mongoose.model('submitPost', subSchema);
