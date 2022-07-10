function showError() {
    let y = this.y.value;
    let isEmptyX = document.getElementById("hiddenButton").value < -100.0;

    if (y.length === 0 || isNaN(y) || y < -5 || y > 3 || isEmptyX || dotsDisabled) {
        document.getElementById("error").style.display="block";
        document.getElementById("submit").disabled = true;
    }
    else{
        document.getElementById("error").style.display="none";
        document.getElementById("submit").disabled = false;
    }
    document.querySelectorAll('input[type="text"]');
}