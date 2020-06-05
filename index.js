//Importation des modules necessaires
const express= require("express")
const app=express()
const body=require("body-parser")
const fileupload=require("express-fileupload")
const database=require("./PostgreSql/index")
const root=require("./Routeur/root")

app.use((req,rep,next)=>{
    rep.header("Access-Control-Allow-Origin","*")
    rep.header("Access-Control-Allow-Headers","Accept")
    next()
})
app.use(body.json())
app.use(body.urlencoded({extended:true}))
app.use(fileupload({}))
app.use("/root", root)

app.get("/",(i, o)=>{
    o.end("OK")
})

app.post("/login",(req,resp)=>{
    let profils=[]
    database.seConnecter([req.body.username,req.body.password],(data)=>{
        if(data==undefined) resp.json({
            data:undefined
        })
        else{
            database.getProfils(1, (res=>{
                res.map(e=>profils.push(menus(e.profil)))
                console.log(profils)
                resp.json({
                    user:{
                        id:data.id,
                        login:data.login,
                        password:data.password,
                    },
                    profils
                })
            }))
        }
    } )
})

function menus(profil){
    switch(profil){
        case "Administrateur général":
            return {
                role:"Administrateur général",
                menu:[
                    {lien:"cooperative", label:"Coopérative"},
                    {lien:"root", label:"Administrateur général"},
                    {lien:"admin", label:"Administrateur"},
                ]
            }
        break

        default:
        break
    }
}


const PORT=8000
//Demarage de l'application
app.listen(PORT, ()=>{
    console.log(`APPLICATON disponible sur le PORT ${PORT}`)
})