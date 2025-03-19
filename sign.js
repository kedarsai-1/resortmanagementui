
(function() {
    
    emailjs.init("GOtN2fyFWbYerzpaV");
})();

document.addEventListener('DOMContentLoaded', () => {
    const sendOtpButton = document.querySelector('.btn-send-otp');
    sendOtpButton.addEventListener('click', sendOTP);
});

function sendOTP() {
    const email = document.getElementById('email');
    const otpverify = document.querySelector('.email-verify');
    
    // Validate email
    if (!email || !email.value) {
        alert('Please enter an email address');
        return;
    }

    // Basic email validation
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email.value)) {
        alert('Please enter a valid email address');
        return;
    }
    
    // Generate 6-digit OTP
    const otp_code = String(Math.floor(100000 + Math.random() * 900000));
    
    // Show loading state
    const sendOtpButton = document.querySelector('.btn-send-otp');
    sendOtpButton.disabled = true;
    sendOtpButton.textContent = 'Sending...';

    // Prepare template parameters
    const templateParams = {
        to_email: email.value,
        otp_code: otp_code
    };

    // Send email using EmailJS
    emailjs.send(
        'service_15hl5en',     // Replace with your Service ID
        'template_w0u0dsf',    // Replace with your Template ID
        templateParams
    ).then(function() {
        // Reset button state
        sendOtpButton.disabled = false;
        sendOtpButton.textContent = 'Send OTP';

        alert("OTP sent to your email " + email.value);
        otpverify.style.display = "flex";
        
        const otp_inp = document.getElementById("otp-input");
        const otp_btn = document.getElementById("btn-verify-otp");
        
        // Remove any existing event listeners
        const newOtpBtn = otp_btn.cloneNode(true);
        otp_btn.parentNode.replaceChild(newOtpBtn, otp_btn);
        
        newOtpBtn.addEventListener("click", () => {
            if (otp_inp.value === otp_code) {
                alert("Email verified successfully!");
                window.location.href = "bookingpage.html";
                otpverify.style.display = "none";
                email.value = "";
                otp_inp.value = "";
            } else {
                alert("Invalid OTP. Please try again.");
            }
        });
    }).catch(error => {
        console.error("Error sending email:", error);
        alert("Failed to send OTP. Please try again later.");
        // Reset button state
        sendOtpButton.disabled = false;
        sendOtpButton.textContent = 'Send OTP';
    });
}