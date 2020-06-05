const express=require("express")
const md5=require("md5")
const routeur=express.Router()

const sql=require("../PostgreSql/root")

routeur.post("/addcooperative", (req,res)=>{
    let values=[]
    for (const key in req.body) {
        values.push(req.body[key])
    }
    sql.addcooperative(values,(data)=>{
        res.json(data)
    })
})

routeur.get("/getcooperatives", (req,res)=>{
    sql.getAll("cooperatives",(data)=>{
        res.json(data)
    })
})

routeur.post("/getcooperative", (req,res)=>{
    
})

routeur.post("/addadmin", (req,res)=>{
    
    sql.addadmin([req.body.username, md5(req.body.Password), req.body.cooperative], (data)=>{
        res.json(data)
    })
})


routeur.get("/getAdmins",(ping,pong)=>{
    sql.getAdmins((data)=>{
        pong.json(data)
    })
})

routeur.post("/addprofil", (req,res)=>{
    
})

module.exports=routeur