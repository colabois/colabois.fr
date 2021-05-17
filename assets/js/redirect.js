let lang = (navigator.userLanguage || navigator.language).substring(0, 2);
        
let supportedLanguages = [
    "en",
    "fr",
    "es",
    "eo"
];

if (lang in supportedLanguages) {
    let hostname = window.location.hostname;
    let referrer = document.referrer;

    let landingPage = !referrer || referrer.indexOf(hostname) == -1;

    if (landingPage) {
        window.location = '/' + suitable_lang + '/';
    }
}
