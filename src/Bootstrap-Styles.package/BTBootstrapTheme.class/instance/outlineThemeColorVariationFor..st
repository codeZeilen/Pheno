styles
outlineThemeColorVariationFor: aClassSymbol

	self themeColors with: self themeColorTypes do: [:color :type | | selector |
		selector := {aClassSymbol. type}.
		(self for: selector)
			backgroundColor: Color transparent;
			borderColor: color;
			color: color.
		
		(self for: selector state: #(hover))
			backgroundColor: color;
			borderColor: color;
			color: (self foregroundColorForBackgroundColor: color).
		
		(self for: (BTClassSelector for: selector state: #(hover active)),
			(BTClassSelector for: selector state: #active),
			(BTClassSelector for: selector state: #selected))
			backgroundColor: (color adjustBrightness: -0.1);
			borderColor: (color adjustBrightness: -0.1)]