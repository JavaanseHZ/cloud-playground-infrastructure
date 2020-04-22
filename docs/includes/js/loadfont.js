var f = new FontFace("Rudiment", "url(../includes/fonts/Rudiment.woff)", {});
f.load().then(function (font) {
    document.fonts.add(font);
})