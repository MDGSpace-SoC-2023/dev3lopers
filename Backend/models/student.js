const mongoose = require('mongoose')
const {Schema} = mongoose;

const studentSchema = new Schema({
    userID: {
        type: String,
        required: true,
        unique: true,
      },
      profilePic: {
        type: String, // Assuming you store the path or URL of the profile picture
      },
      name: {
        type: String,
        required: true, 
      },
      enrollmentNumber: {
        type: Number,
        required: true,
        unique: true,
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
      },
      engagements: {
        type: [String], // Assuming multiple engagements as an array of strings
      },
      cgpa: {
        type: Number,
      },
      description: {
        type: String,
      },
  //  password :{
  //       type : String,
  //       required : true
  //  },
  //  date :{
  //       type : Date,
  //      default : Date.now
  //  },

  });

  const Student = mongoose.model('student',studentSchema);
  module.exports = Student;