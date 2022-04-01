document.addEventListener('DOMContentLoaded', function(){
  const postForm =document.getElementById("new_edit");
  const fileField = document.querySelector('input[type="file"][name="diary[images][]"]');
  const imageLimits = 3;
  
  if (!postForm) return null;
  
  const buildNewFileField = (e) => {
    const newFileField = document.createElement('input');
    newFileField.setAttribute('type', 'file');
    newFileField.setAttribute('name', 'diary[images][]');
    newFileField.setAttribute('accept', '.png, .jpg, .jpeg');

    const lastFileField = document.querySelector('input[type="file"][name="diary[images][]"]:last-child');
    const nextDataIndex = Number(lastFileField.getAttribute('data-index')) +1;
    newFileField.setAttribute('data-index', nextDataIndex);
    
    newFileField.addEventListener("change", changedFileField);
    
    const fileFieldsArea = document.querySelector('.click-upload');
    fileFieldsArea.appendChild(newFileField);
  };
  
  const changedFileField = (e) => {
    const imageCount = document.querySelectorAll('input[name="diary[images][]"]').length;
    if (imageCount < imageLimits) buildNewFileField();
  };
  
  fileField.addEventListener('change', changedFileField);
});
