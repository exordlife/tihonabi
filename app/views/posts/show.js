// ポップアップのセッティング処理
function popupSetting(){
  let popup = document.getElementById('popup');
  if(!popup) return;

  let bgBlack = document.getElementById('bg-black');
  let closeBtn = document.getElementById('close-btn');
  let showBtn = document.getElementById('show-btn');

  // ポップアップ
  popUp(bgBlack);
  popUp(closeBtn);
  popUp(showBtn);

  // ポップアップ処理
  function popUp(elem){
    if(!elem) return;
  
    elem.addEventListener('click', function(){
      popup.classList.toggle('is-show');
    });
  }
}

// ポップアップのセッティング
popupSetting();