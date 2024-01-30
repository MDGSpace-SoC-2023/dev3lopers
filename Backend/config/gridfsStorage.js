const {GridFsStorage} = require('multer-gridfs-storage');

require("dotenv").config()
const url = process.env.Mongo_URL


// Create a storage object with a given configuration
const storage = new GridFsStorage({
    url,
    file: (req, file) => {
      if (file.mimetype === "image/jpeg" || file.mimetype === "image/png") {
        return {
          bucketName: "photos",
          filename: `${Date.now()}_${file.originalname}`,
        };
      } else {
        // Specify your default bucket name here
        return {
          bucketName: "defaultBucketName",
          filename: `${Date.now()}_${file.originalname}`
        };
      }
    },
  });
  
  const upload = multer({  storage });

module.exports = upload;
