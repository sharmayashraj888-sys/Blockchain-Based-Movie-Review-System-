<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>BLACKWINE | Login</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;800&display=swap" rel="stylesheet">

<style>
/* ===== RESET ===== */
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

/* ===== PAGE BACKGROUND ===== */
body{
    height:100vh;
    background:
      radial-gradient(circle at top, #2c2c2c 0%, #141414 45%, #000000 100%);
    color:#ffffff;
    display:flex;
    align-items:center;
    justify-content:flex-end;
    padding-right:90px;
    overflow:hidden;
}

/* ===== BRAND / LOGO SECTION ===== */
.brand{
    position:absolute;
    left:80px;
    top:50%;
    transform:translateY(-50%);
    display:flex;
    align-items:center;
    gap:25px;
}

.brand img{
    width:180px;
    mix-blend-mode:multiply;
   
}

.brand img{
    width:180px;

    /* MAKE IT VIBRANT */
    filter:
        brightness(1.4)
        contrast(1.3)
        drop-shadow(0 0 25px rgba(255,255,255,0.4))
        drop-shadow(0 0 60px rgba(255,255,255,0.15));

    mix-blend-mode: screen;   /* IMPORTANT */

}

.brand-text h1{
    font-size:48px;
    font-weight:800;
    letter-spacing:6px;
    color:#ffffff;
}

.brand-text p{
    margin-top:8px;
    font-size:14px;
    letter-spacing:3px;
    color:#bdbdbd;
}




/* ===== LOGIN CARD ===== */
.login-card{
    width:420px;
    padding:50px;
    border-radius:26px;
    background:rgba(255,255,255,0.06);
    backdrop-filter:blur(20px);
    box-shadow:0 0 70px rgba(0,0,0,0.6);
}

img{
    width:180px;
    filter:
        grayscale(100%)
        brightness(1.05)
        contrast(1.1)
        drop-shadow(0 0 25px rgba(255,255,255,0.25));
    mix-blend-mode:multiply;
    animation:float 6s ease-in-out infinite;
}
/* TITLE */
.login-card h2{
    font-size:28px;
    letter-spacing:3px;
    margin-bottom:10px;
}

.login-card p{
    font-size:13px;
    color:#bdbdbd;
    margin-bottom:35px;
}

/* INPUTS */
.input-group{
    position:relative;
    margin-bottom:22px;
}

.input-group input{
    width:100%;
    padding:16px 18px;
    border-radius:16px;
    border:none;
    outline:none;
    background:#0e0e0e;
    color:#ffffff;
    font-size:15px;
}

.input-group label{
    position:absolute;
    top:50%;
    left:18px;
    transform:translateY(-50%);
    font-size:14px;
    color:#9e9e9e;
    pointer-events:none;
    transition:0.3s;
}

.input-group input:focus + label,
.input-group input:not(:placeholder-shown) + label{
    top:-8px;
    font-size:11px;
    background:#0e0e0e;
    padding:0 6px;
    color:#ffffff;
}

/* BUTTON */
button{
    width:100%;
    margin-top:25px;
    padding:16px;
    border:none;
    border-radius:26px;
    font-size:16px;
    font-weight:700;
    letter-spacing:2px;
    cursor:pointer;
    background:linear-gradient(135deg,#ffffff,#bdbdbd);
    color:#000000;
    transition:0.3s;
}

button:hover{
    box-shadow:0 0 35px rgba(255,255,255,0.5);
    transform:scale(1.05);
}

/* LINKS */
.links{
    margin-top:25px;
    font-size:14px;
    color:#bdbdbd;
}

.links a{
    color:#ffffff;
    text-decoration:none;
    font-weight:600;
}

.links a:hover{
    text-decoration:underline;
}
</style>
</head>

<body>
<form action="<%= request.getContextPath() %>/login" method="post">

<!-- BRAND / LOGO -->
<div class="brand">
    <img src="logo2.png" alt="BLACKWINE Logo">
    <div class="brand-text">
        <h1>BLACKWINE</h1>
        <p>Discover | Rate | Recommend</p>
    </div>
</div>

<!-- LOGIN CARD -->
<div class="login-card">
    <h2>LOGIN</h2>
    <p>Access to BLACKWINE account</p>

    <div class="input-group">
        <input type="text" id="email" name="email" required placeholder=" ">
        <label>Email</label>
    </div>

    <div class="input-group">
        <input type="password" id="password" name="password"required placeholder=" ">
        <label>Password</label>
    </div>

    <button type="submit">LOGIN</button>

    <div class="links">
        New user? <a href="signup.jsp">Create Account</a>
    </div>
</div>


</form>
</body>
</html>
