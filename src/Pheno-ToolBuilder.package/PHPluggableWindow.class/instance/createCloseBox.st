as yet unclassified
createCloseBox
	^ (self createBox: (self createBoxForm: #windowCloseButton))
		actionSelector: #closeBoxHit;
		setBalloonText: 'close this window' translated