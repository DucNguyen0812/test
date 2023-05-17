
let myList=JSON.parse(localStorage.getItem('myList')) || [];

renderList();

function updateList(){
  const input=document.getElementById('input').value;
  const date=document.getElementById('date').value;
  myList.push({name:input,day:date});
  }
  
function renderList(){
  let finalHTML='';
    for(let i=0;i<myList.length;i++){
      const todo=myList[i].name;
      const when=myList[i].day;
      const html=`
        <div class="name">${todo}</div> <div class="date">${when}</div> <button class="deletebtn" onclick="myList.splice(${i},1);
        saveFile();
        renderList();">Delete</button>
      `;
      finalHTML+= html;
      
    }
    document.getElementById('div1').innerHTML=finalHTML;
  } 
  
  function saveFile(){
    localStorage.setItem('myList',JSON.stringify(myList));
  }

  function refresh(){
    document.getElementById('input').value='';
    document.getElementById('date').value='';
  }
 
