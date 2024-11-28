function toggleElement(elementId) {
    var element = document.getElementById(elementId);
    element.style.display = (element.style.display == 'none' || element.style.display == '') ? 'block' : 'none';
}
