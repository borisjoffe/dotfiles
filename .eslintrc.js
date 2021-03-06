module.exports = {
	'parser': 'babel-eslint',
	'root': true,
	'globals': {
		'_'     : true,
		'$'     : true,
		'React' : true,
		'angular' : true,
	},
	'rules': {
		'comma-dangle': [2, 'always-multiline'],
		'indent': [0, 'tab'],
		//'indent': [2, 'tab', {'VariableDeclarator': 0}],
		'quotes': [1, 'single'],
		'linebreak-style': [2, 'unix'],
		'no-mixed-spaces-and-tabs': [2, 'smart-tabs'],
		'semi': [0, 'never'],
		'no-unused-vars': 0,
		'no-console': 0,
	},
	'env': {
		'es6': true,
		'browser': true,
		'node': true,
	},
	'extends': 'eslint:recommended',
	'parserOptions': {
		'ecmaVersion': 6,
		'sourceType': 'module',
		'ecmaFeatures': {
			'arrowFunctions': true,
			'destructuring': true,
			'jsx': true,
			'modules': true,
			'experimentalObjectRestSpread': true,
		},
	},
	'plugins': [
		'react',
	],
}
