var express = require('express');
var router = express.Router();
const multer = require("multer")
// const { GridFsStorage } = require("multer-gridfs-storage")
// const
//  upload = require('../config/multerConfig');
const fetchUser = require('../middlewares/fetchUser');
const User = require('../models/user');
// import {v2 as cloudinary} from 'cloudinary';
const cloudinary = require('cloudinary').v2;
// const v2=require("cloudinary").cloudinary;
// import multer from 'multer';
          
cloudinary.config({ 
  cloud_name: 'dmxxxzax6', 
  api_key: '193916475952333', 
  api_secret: 'jhhkS_p7FcqSIQeg_s-GVkZKArY' 
});
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });
// const upload = multer({ storage: storage });


router.put('/saveprofile',fetchUser, async (req,res)=>{
    try {
        const userId = req.user.id;
      const updatedUser = await User.replaceOne({_id:userId},req.body);
      res.send("done");
       
    } catch (error) {
        console.error(error);
    }
})

// router.post('/uploaddp', fetchUser, upload.single('profilePic'), async (req, res) => {
//     try {
//         const userId = req.user.id; // Assuming you're sending the user's ID
//         const file = req.file;

//         if (!file) {
//             return res.status(400).send('No file uploaded');
//         }

//         const user = await User.findById(userId);
//         if (!user) {
//             return res.status(404).send('User not found');
//         }

//         user.profilePic = file.filename; // or file.id, depending on how you're storing it
//         await user.save();

//         res.send('Profile picture uploaded successfully');
//     } catch (error) {
//         console.error(error.message);
//         res.status(500).send('Server error');
//     }
// });



router.post("/upload/image", upload.single("avatar"), (req, res) => {
    const file = req.uploads.file
    // Respond with the file details
    res.send({
      message: "Uploaded",
      id: file.id,
      name: file.filename,
      contentType: file.contentType,
    })
  })

// router.post('/upload',fetchUser ,upload.single('profilePic'), async (req, res) => {
//     try {
//         const userId = req.user.id; // Assuming you're getting the user's ID from the request body
//         const filePath = req.file.path; // Path of the uploaded file

//         // Find the user by ID and update the profilePic field
//         const updatedUser = await User.findByIdAndUpdate(
//             userId,
//             { profilePic: filePath },
//             { new: true } // Return the updated document
//         );

//         if (!updatedUser) {
//             return res.status(404).send('User not found');
//         }

//         // Send back the updated user information
//         res.json(updatedUser);
//     } catch (error) {
//         console.error(error);
//         res.status(500).send('Error uploading file');
//     }
// });
router.post('/upload', fetchUser ,upload.single('file'), async (req, res) => {
    try {
        if (!req.file) {
            return res.status(400).json({ error: 'No file provided' });
        }

        const result = await cloudinary.uploader.upload_stream(
            async (error, result) => {
                const userId = req.user.id
                if (error) {
                    console.error('Error during image upload:', error);
                    res.status(500).json({ error: 'Failed to upload image' });
                } else {
                    
                    const updatedUser = await User.findByIdAndUpdate(
                        userId,
                        { profilePic:result.secure_url},
                        { new: true } 
                    )
                    // res.json({ imageUrl: result.secure_url });

                    res.json("done")
                }
            }
        ).end(req.file.buffer);

    } catch (error) {
        console.error('Error during image upload:', error);
        res.status(500).json({ error: 'Failed to upload image' });
    }
});



module.exports = router;