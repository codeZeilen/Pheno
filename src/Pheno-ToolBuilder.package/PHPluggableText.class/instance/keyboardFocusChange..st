as yet unclassified
keyboardFocusChange: weHaveFocus

	super keyboardFocusChange: weHaveFocus.
	
	self styleContext stateActive: weHaveFocus.
	self changed