---
title: People
layout: collection
collection: people
---

| Name | Role | Contact | Office Hours |
|------|------|---------|--------------|
{% for person in site.data.personnel %} | {{ person.name }} | {{ person.role | default: "" }} | {% if person.email_link and person.email %}[{{ person.email }}]({{ person.email_link }}){% elsif person.email %}{{ person.email }}{% else %}{% endif %} | {{ person.office_hours | default: "" }} |
{% endfor %}

![Logical Distortion]({{ site.baseurl }}/assets/images/aura-of-logical-distortion.gif "Sometimes it helps just having someone else around")
