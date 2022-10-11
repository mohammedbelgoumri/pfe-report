if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
settings.inlinetex=true;
deletepreamble();
defaultfilename="main-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import drawtree;

treeLevelStep = 1cm;
treeNodeStep = 0cm;

TreeNode RACINE = makeNode( "France" );
TreeNode DF1 = makeNode( RACINE, "France" );
TreeNode DF2 = makeNode( RACINE, "Br\'esil" );

TreeNode QF1 = makeNode( DF1, "France" );
TreeNode QF2 = makeNode( DF1, "Croatie" );
TreeNode QF3 = makeNode( DF2, "Br\'esil" );
TreeNode QF4 = makeNode( DF2, "Pays-Bas" );

draw(RACINE,(0,0));

shipout(bbox(5mm,white));

