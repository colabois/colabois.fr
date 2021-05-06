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
	if (language == "fr") {
		document.location.href = "/fr"
	} else {
		document.location.href = "/en"
	}
</script>
