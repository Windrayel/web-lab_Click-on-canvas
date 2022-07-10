function pressEffect(a) {
    let inputs = document.getElementsByName("X");
    for (let i = 0; i < inputs.length; i++) {
        if (inputs[i].type === 'button') {
            inputs[i].style.borderStyle="initial";
        }
    }
    document.getElementById(a).style.borderStyle="inset";
    a = a.substring(1)
    document.getElementById("hiddenButton").value = a;
    showError()
}
