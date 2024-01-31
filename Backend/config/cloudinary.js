import {v2 as cloudinary} from 'cloudinary';
// const v2=require("cloudinary").cloudinary;
import multer from 'multer';
          
cloudinary.config({ 
  cloud_name: 'dmxxxzax6', 
  api_key: '193916475952333', 
  api_secret: 'jhhkS_p7FcqSIQeg_s-GVkZKArY' 
});
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

cloudinary.uploader.upload("https://upload.wikimedia.org/wikipedia/commons/a/ae/Olympic_flag.jpg",
  { public_id: "olympic_flag" }, 
  function(error, result) {console.log(result); });