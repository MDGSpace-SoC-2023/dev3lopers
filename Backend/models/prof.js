const mongoose = require('mongoose')
const {Schema} = mongoose;

const profSchema = new Schema({
      profilePic: {
        type: String, // Assuming you store the path or URL of the profile picture
      },
      name: {
        type: String,
        required: true,
      },
      email: {
        type: String,
        required: true,
        unique: true,
        lowercase: true,
      },
      mobileNumber: {
        type: String,
        required:true
      },
      // prof_or_student: {
      //   type: Boolean,
      // },
      department: {
        type: String,
        required:true,
      },
      engagements: {
        type: [String], // Assuming multiple engagements as an array of strings
      },
      description: {
        type: String,
      },
   password :{
        type : String,
        required : true
   },
   date :{
        type : Date,
       default : Date.now
   },

  });

  const Prof = mongoose.model('prof',profSchema);
  module.exports = Prof;