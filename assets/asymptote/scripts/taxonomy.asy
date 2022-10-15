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