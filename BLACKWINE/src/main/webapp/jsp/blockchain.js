// ============================================================
//  BLACKWINE — blockchain.js (FIXED)
// ============================================================

// ── CONTRACT CONFIG ──────────────────────────────────────────
const contractAddress = "0x5d33077d7C1baB18647704526E5234b60aA19C10";

// ── ABI (MATCHES YOUR CONTRACT) ─────────────────────────────
const abi = [
    {
        "inputs": [
            { "internalType": "string", "name": "_movieName", "type": "string" },
            { "internalType": "string", "name": "_reviewText", "type": "string" },
            { "internalType": "uint256", "name": "_rating", "type": "uint256" }
        ],
        "name": "addReview",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [],
        "name": "getReviews",
        "outputs": [
            {
                "components": [
                    { "internalType": "string", "name": "movieName", "type": "string" },
                    { "internalType": "string", "name": "reviewText", "type": "string" },
                    { "internalType": "uint256", "name": "rating", "type": "uint256" },
                    { "internalType": "address", "name": "reviewer", "type": "address" }
                ],
                "internalType": "struct MovieReview.Review[]",
                "name": "",
                "type": "tuple[]"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    }
];

// ── GLOBALS ─────────────────────────────────────────────────
let web3;
let contract;

// ── INIT WALLET ─────────────────────────────────────────────
window.onload = async function () {
    if (window.ethereum) {
        try {
            web3 = new Web3(window.ethereum);
            await window.ethereum.request({ method: 'eth_requestAccounts' });
            contract = new web3.eth.Contract(abi, contractAddress);
            console.log("Wallet connected");
        } catch (e) {
            console.error("Wallet connection failed:", e);
        }
    } else {
        alert("Install MetaMask");
    }
};

// ── ADD REVIEW ───────────────────────────────────────────────
async function addReviewToBlockchain(movie, review, rating) {
    if (!contract) {
        alert("Contract not ready yet");
        return;
    }

    const accounts = await web3.eth.getAccounts();

    try {
        await contract.methods
            .addReview(movie, review, rating)
            .send({ from: accounts[0] });

        console.log("Saved to blockchain");
    } catch (err) {
        console.error(err);
        alert("Error: " + err.message);
    }
}

// ── GET REVIEWS (FIXED) ─────────────────────────────────────
async function showReviewsForMovie(title) {
    const reviewBox = document.getElementById("reviewBox");
    if (!reviewBox) return;

    if (!contract) {
        reviewBox.innerHTML = `<p style="color:#888;font-size:13px;">
            Connect MetaMask to see blockchain reviews.</p>`;
        return;
    }

    reviewBox.innerHTML = `<p style="color:#888;font-size:13px;">Loading reviews…</p>`;

    try {
        // ✅ get ALL reviews from contract
        const allReviews = await contract.methods.getReviews().call();

        // ✅ filter by movie (frontend fix)
        const reviews = allReviews.filter(r =>
            r.movieName.toLowerCase().trim() === title.toLowerCase().trim()
        );

        if (!reviews || reviews.length === 0) {
            reviewBox.innerHTML = `<p style="color:#888;font-size:13px;">
                No reviews yet. Be the first!</p>`;
            return;
        }

        reviewBox.innerHTML = reviews.map(r => `
            <div class="review-card">
                <div class="review-header">⭐ ${r.rating}/10</div>
                <div class="review-text">${escapeHtml(r.reviewText)}</div>
                <div class="review-user">
                    ${r.reviewer.slice(0, 6)}…${r.reviewer.slice(-4)}
                </div>
            </div>
        `).join("");

    } catch (err) {
        console.error("getReviews error:", err);
        reviewBox.innerHTML = `<p style="color:#e57373;font-size:13px;">
            Could not load reviews.</p>`;
    }
}

// ── HELPER ──────────────────────────────────────────────────
function escapeHtml(str) {
    if (typeof str !== "string") return "";
    return str
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}