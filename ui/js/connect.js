function PNG_Post(event, body = { key: value }) {
  fetch(`https://PNG_scoreboard/${event}`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(body),
  })
    .then((response) => {
      if (response.ok) {
        return response.json();
      } else {
        throw new Error("Network response was not ok.");
      }
    })
    .then((data) => {
      console.log(data);
    })
    .catch((error) => {
      console.error("There was a problem with the fetch operation:", error);
    });
}

let num_player = document.querySelector("#num-player");
let police_number = document.querySelector("#police-number");
let medic_number = document.querySelector("#medic-number");
let sheriff_number = document.querySelector("#sheriff-number");
let mechanic_number = document.querySelector("#mechanic-number");
let taxi_number = document.querySelector("#taxi-number");

// function format(elemnt, count, islimit, limit) {
//   console.log(elemnt, count, islimit, limit);


// }

window.addEventListener("message", (event) => {


  let data = event.data;
  if (data.showUI == false) {
    main.style.top = "-50%";
  } else if (data.showUI == true) {
    main.style.top = "50%";
  }




  if (data.palyernum != undefined) {
    num_player.innerHTML = data.palyernum + ' / 128'
  } else if (data.medic != undefined) {
    medic_number.innerHTML = data.medic
  } else if (data.mechanic != undefined) {
    mechanic_number.innerHTML = data.mechanic
  } else if (data.sheriff != undefined) {
    sheriff_number.innerHTML = data.sheriff
  } else if (data.taxi != undefined) {
    taxi_number.innerHTML = data.taxi
  } else if (data.police != undefined) {
    police_number.innerHTML = data.police
    if (data.police >= 7) {
      police_number.innerHTML = "+7"
    }

  }

})

document.addEventListener("keydown", function (event) {
  if (event.key == 'Escape' || event.key == "F10") {
    main.style.top = "-50%";
    PNG_Post('hide', body = { mouse: false })
  }

});


