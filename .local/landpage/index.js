function startTime(){
  let today=new Date();
  let cDate = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
  let h=today.getHours();
  let m=today.getMinutes();
  let s=today.getSeconds();
  // add a zero in front of numbers<10
  m=checkTime(m);
  s=checkTime(s);
  document.querySelector('#date').innerHTML=cDate;
  document.querySelector('#time').innerHTML=h+":"+m+":"+s;
  t=setTimeout('startTime()',500);
  }
  function checkTime(i){
    if (i<10){
      i="0" + i;
    }
    return i;
}

onload=startTime();
