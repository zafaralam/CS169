##############################################################################################
# CSS notes                                                                                  #
##############################################################################################

~	PSEUDOCLASSES example for <a> tag
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
a:link {
	color: #0000FF;
	text-decoration: none;
}
a:active {
	color: #FF0000;
	background-color: #FFFFCC;
}
a:focus {
	border-style: dashed;
	border-width: 1px;
	background-color: #FFA500;
}
a:hover {
	color: #FF0000;
	text-decoration: underline;
}
a:visited {
	color: #A020F0;
	text-decoration: none;
}

~	PSEUDO-ELEMENTS example with <p> tag
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

p:first-line {
	background-color: yellow;
}
p:first-letter {
	color: red;
	font-size: 150%;
}

~	CONTEXTUAL SELECTORS example using <p> & <strong> tags
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/* 
	All <strong> elements within the <p> tag will have this style regardless of weather they
	appear directly after the parent or not.
*/
p strong {
	background-color: lightgray;
}

~ DIRECT DECENDENT SELECTORS example using <p> & <strong> tags
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

p > strong {
	background-color:lightgreen; 
}

~ ADJACENT SIBLING SELECTORS example using <h1> & <p> tags
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

html
----

<h1>I am a heading</h1>
<p>I'm an adjacent paragraph so i am red~</p>
<p>I am not an adjacent paragraph so I am not red</p>

css
---

h1 + p {color: red;}

~ GENERAL SIBLING SELECTORS
~~~~~~~~~~~~~~~~~~~~~~~~~~~

html
----

<p>I am not red.</p>
<h1>Heading 1</h1>
<p>I am red.</p>
<h2>Heading 2</h2>
<p>I am red too.</p>
<div><p>Not me as I am not a sibling given that I am one level down.</p></div>

css
---

h1 ~ p {color: red;}

~ ATTRIBUTE SELECTORS
~~~~~~~~~~~~~~~~~~~~~

a[href] {background-color: yellow;}

a[href="http://www.htmlref.com"] {font-weight: bold;}

p[title ~= "Larry"] {font-style: italic;}
<p title="Larry Curly and Moe">This is italic</p>
<p title="Larry">This is italic</p>
<p title="Larry-The-Stooge">This is not italic</p>

p[lang|="en"] {color: red;} /* for attribute values seperated by dashes */


~ HTML document Structure and Inheritance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/********************
*	-html
*		-head
*			-title
*		-body
*			-p
*				-b
*			-h1
*********************/

