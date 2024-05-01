document.getElementById("loginForm").addEventListener("submit", function(event) {
    event.preventDefault();

    var username = document.getElementById("voter-id").value;
    var password = document.getElementById("password").value;

    // Combine username and password
    var combinedInfo = username + password;

    // Hash the combined information using SHA-256
    var cryptoIdentifier = CryptoJS.SHA256(combinedInfo).toString();

    // Display the unique cryptographic identifier to console
    console.log("Unique Cryptographic Identifier:", cryptoIdentifier);
});
