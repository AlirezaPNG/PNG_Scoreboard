dicordlink = 'https://discord.gg/ApcmhF55yk'

let main = document.querySelector(".main");
let btn = document.querySelector("#dis-btn");
let btn_inner = document.querySelector(".bi-discord");



//btn


btn.addEventListener('click' , ()=>{
  navigator.clipboard.writeText(dicordlink)
  btn_inner.innerHTML = ' Copied link !'

  setTimeout(()=>{
    btn_inner.innerHTML = ' Discord'
  },2000)
});


