var jwt = require('jsonwebtoken');
jwt_secret = process.env.JWT_SECRET;

const fetchUser = (req,res,next)=>{
    const token = req.header('auth-token');
    if (!token) {
        return res.status(401).json({ error: "Missing auth-token" });
    }
    
    try {
        const data = jwt.verify(token, jwt_secret);
        req.user = data.user;
        next();
    } catch (error) {
        res.status(401).json({ error: "Invalid auth-token" });
    }
}    

module.exports = fetchUser;