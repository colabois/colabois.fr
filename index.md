---
layout: base
title: Redirecting...
permalink: /
---

## Redirecting...

This page is available in multiple languages. 

It should be redirecting you automatically, but if not, please choose a language below

{% for language in site.data.languages %}
[{{ language.name }}]({{ language.link }})
{% endfor %}

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
	switch ((navigator.language || navigator.userLanguage).substring(0, 2)) {
		{% for language in site.data.languages %}
		case '{{ language.iso }}':
			document.location.href = '{{ language.link }}';
			break;
		{% endfor %}
		default:
			document.location.href = "/en";
	}
</script>
