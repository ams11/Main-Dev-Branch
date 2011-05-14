
/* soletron.js */

function soleInitDropdowns() {
	try {
		//alert("soleInitDropdowns()");
		$('ul.soleDropdownSub').hide();
		$('ul.soleDropdownMain li').hover(
			function () {
				$(this).find('ul.soleDropdownSub').show();
			},
			function () {
				$(this).find('ul.soleDropdownSub').hide();
			}
		);
	}
	catch (e) {
		alert("soleInitDropdowns(): exception: " + e.name + ", " + e.message);
	}
}
