private
roundRectShapeWithTipBounds: aRectangle radius: r borderWidth: width tipSize: tipSize
	"note: none of the values will be scaled. call #withScalingFactor on radius/width/tipSize before passing"

	| circle points maxRadius radius |
	maxRadius := (aRectangle width min: aRectangle height) / 2.
	radius := Rectangle left: (r left min: maxRadius) right: (r right min: maxRadius) top: (r top min: maxRadius) bottom: (r bottom min: maxRadius).
	circle := radius scaleBy: 0.5522847.
	points := OrderedCollection new.
	
	width top > 0 ifTrue: [ | tipTop  tipStart tipEnd |
		" top left corner "
		radius top > 0 ifTrue: [
			points
				add: aRectangle left @ (aRectangle top + radius top);
				add: aRectangle left @ (aRectangle top + circle top);
				add: aRectangle left + circle top @ aRectangle top;
				add: aRectangle left + radius top @ aRectangle top].
		
		tipStart := aRectangle left + (aRectangle width / 2) - tipSize @ aRectangle top.
		tipEnd := aRectangle left + (aRectangle width / 2) + tipSize @ aRectangle top.
		tipTop := aRectangle left + (aRectangle width / 2) @ (aRectangle top - tipSize).
		
		" top line "
		points
			add: aRectangle left + radius top @ aRectangle top;
			add: aRectangle left + radius top @ aRectangle top;
			add: aRectangle left + radius top @ aRectangle top;
			add: tipStart.
		
		" arrow tip "
		points
			add: tipStart;
			add: tipStart;
			add: tipStart;
			add: tipTop.
			
		points
			add: tipTop;
			add: tipTop;
			add: tipTop;
			add: tipEnd.
			
		points
			add: tipEnd;
			add: tipEnd;
			add: tipEnd;
			add: aRectangle right - radius right @ aRectangle top].

	width right > 0 ifTrue: [
		" top right corner "
		radius right > 0 ifTrue: [
			points
				add: aRectangle right - radius right @ aRectangle top;
				add: aRectangle right - circle right @ aRectangle top;
				add: aRectangle right @ (aRectangle top + circle right);
				add: aRectangle right @ (aRectangle top + radius right)].

		" right line "
		points
			add: aRectangle right @ (aRectangle top + radius right);
			add: aRectangle right @ (aRectangle top + radius right);
			add: aRectangle right @ (aRectangle top + radius right);
			add: aRectangle right @ (aRectangle bottom - radius bottom)].

	width bottom > 0 ifTrue: [
		" bottom right corner "
		radius bottom > 0 ifTrue: [
			points
				add: aRectangle right @ (aRectangle bottom - radius bottom);
				add: aRectangle right @ (aRectangle bottom - circle bottom);
				add: aRectangle right - circle bottom @ aRectangle bottom;
				add: aRectangle right - radius bottom @ aRectangle bottom].

		" bottom line "
		points
			add: aRectangle right - radius bottom @ aRectangle bottom;
			add: aRectangle right - radius bottom @ aRectangle bottom;
			add: aRectangle right - radius bottom @ aRectangle bottom;
			add: aRectangle left + radius left @ aRectangle bottom].

	width left > 0 ifTrue: [
		" bottom left corner "
		radius left > 0 ifTrue: [
			points
				add: aRectangle left + radius left @ aRectangle bottom;
				add: aRectangle left + circle left @ aRectangle bottom;
				add: aRectangle left @ (aRectangle bottom - circle left);
				add: aRectangle left @ (aRectangle bottom - radius left)].

		" left line "
		points
			add: aRectangle left @ (aRectangle bottom - radius left);
			add: aRectangle left @ (aRectangle bottom - radius left);
			add: aRectangle left @ (aRectangle bottom - radius left);
			add: aRectangle left @ (aRectangle top + radius top)].
	
	^ points asPointArray