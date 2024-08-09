nb:=0;
DoMethod1:=true;
if DoMethod1 then
  ListGroup:=[];
  ListSample:=[];
  ListAtt:=[];
  while(true)
  do
    ListPair:=[[3,1], [4,1], [5,7], [6,nb]];
    nbV:=(3 + 4 + 5*7 + 6*nb)/3;
    Print("ListGroup=", ListGroup, "\n");
    LPL:=GetList3valentPlaneGraphSpecifiedFvector(nbV, ListPair);
    Print("ListGroup=", ListGroup, "\n");
    for ePL in LPL
    do
      ePLd:=DualGraph(ePL).PlanGraph;
      ListDeg:=List(ePLd, Length);
      pos3:=Position(ListDeg, 3);
      pos4:=Position(ListDeg, 4);
      pos:=Position(ePLd[pos3], pos4);
      if pos<>fail then
        eGRP:=GroupPlan(ePL).SchoenfliesSymbol;
        posGRP:=Position(ListGroup, eGRP);
        AddSet(ListAtt, nbV);
        if posGRP=fail then
          Add(ListGroup, eGRP);
          Add(ListSample, ePL);
        fi;
      fi;
    od;
    Print("ListGroup=", ListGroup, "\n");
    nb:=nb+1;
  od;
fi;
DoMethod2:=false;
if DoMethod2 then
  while(true)
  do
    ListPair:=[[3,2], [5,6], [6,nb]];
    nbV:=(2*3 + 5*6 + 6*nb)/3;
    LPL:=GetList3valentPlaneGraphSpecifiedFvector(nbV, ListPair);
    for ePL in LPL
    do
      ePLd:=DualGraph(ePL).PlanGraph;
      ListDeg:=List(ePLd, Length);
      ListPos:=Filtered([1..Length(ListDeg)], x->ListDeg[x]=3);
      pos3:=ListPos[1];
      pos4:=ListPos[2];
      pos:=Position(ePLd[pos3], pos4);
      if pos<>fail then
        Print("We got it\n");
        Print(NullMat(5));
      fi;
    od;
    nb:=nb+1;
  od;
fi;
