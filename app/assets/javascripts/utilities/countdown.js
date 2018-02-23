document.addEventListener('turbolinks:load', function() {
  var countdownTimer = document.getElementById('clockdiv');
  if (countdownTimer && countdownTimer.dataset.length > 0) {
var deadline = Date.now() + countdownTimer.dataset.length * 1000;

function getTimeRemaining(endtime){
  var t = endtime - Date.parse(new Date());
  var seconds = Math.floor( (t/1000) % 60 );
  var minutes = Math.floor( (t/1000/60) % 60 );
  var hours = Math.floor( (t/(1000*60*60)) % 24 );
  return {
    'total': t,
    'hours': hours,
    'minutes': minutes,
    'seconds': seconds
  };
}

function initializeClock(id, endtime){
  var clock = document.getElementById(id);
  var timeinterval = setInterval(function(){
    var t = getTimeRemaining(endtime);
    clock.textContent =
                      'hours: '+ t.hours + ' ' +
                      'minutes: ' + t.minutes + ' ' +
                      'seconds: ' + t.seconds;
    if(t.total<=0){
      clearInterval(timeinterval);
      var id = countdownTimer.dataset.id
      $.post('/test_passages/' + id);
    }
  },1000);
}
initializeClock('clockdiv', deadline);
}
});
