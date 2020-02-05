var count = 0;

function showImage(path) {
    console.log("count: ",count)
    var img = document.getElementsByClassName("image_holder")[0];
    var lnk = document.getElementById("sensorboard_image");
    if (count%2==0) {
        lnk.textContent = "Hide image";
        img.src = path;
        img.style.display = 'block';
    } else {
        lnk.textContent = "Show image";
        img.style.display = 'none';
    }
    count++;
}