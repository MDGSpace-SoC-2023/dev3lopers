var jwt = require('jsonwebtoken');
const jwt_secret = "fast is fast";

const fetchUser = (req,res,next)=>{
    const token = req.header('auth-token');
    if (!token) {
        return res.status(401).json({ error: "Missing auth-token" });
    }
    
    try {
        var data = jwt.verify(token, jwt_secret);
        console.log('User Data:', data);

        req.user = data.user;
        next();
    } catch (error) {
        res.status(401).json({ error: "Invalid auth-token" });
    }
    
}    

module.exports = fetchUser;