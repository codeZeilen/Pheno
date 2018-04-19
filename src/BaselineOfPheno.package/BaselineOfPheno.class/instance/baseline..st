baseline
baseline: spec

	<baseline>
	
	spec for: #common do: [
		spec package: 'JSON' with: [spec repository: 'http://www.squeaksource.com/JSON'].
		spec package: 'SVG-Morphic' with: [spec repository: 'http://www.squeaksource.com/SVGMorph'].
		
		spec
			package: 'Pheno-Styles';
			package: 'Pheno-ToolBuilder' with: [spec requires: #('Pheno-Styles')];
			package: 'Pheno-Core' with: [spec requires: #('Pheno-Styles' 'JSON' 'SVG-Morphic')];
			package: 'Pheno-Widgets' with: [spec requires: #('Pheno-Core' 'Pheno-ToolBuilder')];
			package: 'Pheno-Examples' with: [spec requires: #('Pheno-Widgets')];
			package: 'Pheno-Tests' with: [spec requires: #('Pheno-Widgets')];
			package: 'Pheno-Styles-Tests' with: [spec requires: #('Pheno-Tests' 'Pheno-Styles')].
		
		spec
			group: 'minimal' with: #('Pheno-Widgets');
			group: 'default' with: #('Pheno-Examples');
			group: 'tests' with: #('Pheno-Tests' 'Pheno-Styles-Tests')]