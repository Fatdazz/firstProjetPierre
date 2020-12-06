// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
// fonction fibonacci(n, a, b)
//      si n = 0 alors retourner a
//      sinon si n = 1 alors retourner b
//      sinon retourner fibonacci(n-1, b, a+b)



function fibonacci( n, a, b){
	if(n==0){return a;}
	if(n==1){return b;}
	return fibonacci(n-1,b,a+b);
}
