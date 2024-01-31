const mongoose = require('mongoose')
const {Schema} = mongoose;

const userSchema = new Schema({
   profilePic: {
    type: String, // Store the file ID or URL of the uploaded image
    default: '' // Default can be an empty string or a path to a default image
  },
   name:{
        type : String,
        required : true
   },
   enrollmentNumber: {
     type: Number,
     unique: true,
   },
   role:{
          type : Boolean,
          required : true
   },
   email:{
        type : String,
        required : true,
        unique :true
   },
   password :{
        type : String,
        // required : true
   },
   mobileNumber: {
     type: String,
   },
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
   date :{
        type : Date,
       default : Date.now
   },
  });

  const User = mongoose.model('user',userSchema)
  module.exports = User;
  