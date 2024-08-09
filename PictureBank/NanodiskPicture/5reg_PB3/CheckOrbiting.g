ListSize:=[3, 6,2, 
2,2,2,
2,2,1,
1,1,2,
1,2,1];
ListOrbSize:=List(ListSize, x->120/x);
TheSum:=Sum(ListOrbSize);
