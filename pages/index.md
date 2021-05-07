---
layout: base
title: Redirecting...
permalink: /
---

# Redirecting...

This page is available in multiple languages. 

It should be redirecting you automatically, but if not, please choose a language below

[English](/en)

[Français](/fr)

[Italiano](/it)

[Español](/es)

<style>
body {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	min-height: 100vh;
	color: white;
	background-image: url("/img/banner.jpg");
	background-size: cover;

}

a {
	text-decoration: inherit;
	color: inherit;
}
</style>

<script>
	let language = navigator.language || navigator.userLanguage;
	switch (language) {
		case 'fr':
			document.location.href = "/fr";
			break;
		case 'it':
			document.location.href = "/it";
			break;
		case 'es':
			document.location.href = "/es";
			break;
		default:
			document.location.href = "/en";
	}
</script>
