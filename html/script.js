window.addEventListener('message', function (event) {
$('body').animate({ opacity: event.data.show ? 1 : 0 }, 1000);
//    console.log(event.data.temp);
    
//    if(typeof(event.data.items) != 'undefined') {
//                    $("#varMoney small").text(event.data.cash);
//        // .toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
//    }
    if(event.data.items) {
        //console.log(JSON.stringify(event.data.items));
        $("#varMoney small").text(event.data.items.cash.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    }
    
	switch (event.data.action) {
        case 'updateStatusHud':
                if(event.data.temp) { 
                    $("#varTemp small").text(event.data.temp);
                }

                if(event.data.cash) {
                    $("#varMoney small").text(event.data.cash.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                }

				if(event.data.hunger) {
                    $("#varHunger").attr("class", "c100 small first p"+ Math.ceil(event.data.hunger));
                }
                
                if(event.data.thirst) {
                    $("#varThirst").attr("class", "c100 small second p"+ Math.ceil(event.data.thirst));
                }

                if(event.data.stress) {
                    $("#varStress").attr("class", "c100 small first p"+ Math.ceil(event.data.stress));
                }
				
				if(event.data.pee) {
                    $("#varPee").attr("class", "c100  small first p"+ Math.ceil(event.data.pee));
                }
				
				if(event.data.poop) {
                    $("#varPoop").attr("class", "c100 small first p"+ Math.ceil(event.data.poop));
                }
    }
});
