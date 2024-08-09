DoMethod1:=false; # 36
DoMethod2:=false; # never?
DoMethod3:=true;
#
#
#
if DoMethod1 then
  nb:=0;
  while(true)
  do
    p3:=1;
    p4:=1;
    p5:=7;
    p6:=nb;
    ListPair:=[[3,p3], [4,p4], [5,p5], [6,p6]];
    nbV:=(3*p3 + 4*p4 + 5*p5 + 6*p6)/3;
    LPL:=GetList3valentPlaneGraphSpecifiedFvector(nbV, ListPair);
    for ePL in LPL
    do
      ePLd:=DualGraph(ePL).PlanGraph;
      ListDeg:=List(ePLd, Length);
      pos3:=Position(ListDeg, 3);
      pos4:=Position(ListDeg, 4);
      pos:=Position(ePLd[pos3], pos4);
      if pos<>fail then
        Print("We got it\n");
        Print(NullMat(5));
      fi;
    od;
    nb:=nb+1;
  od;
fi;
#
#
#
if DoMethod2 then
  nb:=0;
  while(true)
  do
    p3:=2;
    p5:=6;
    p6:=nb;
    ListPair:=[[3,p3], [5,p5], [6,p6]];
    nbV:=(3*p3 + 5*p5 + 6*p6)/3;
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
#
#
if DoMethod3 then
  nb:=0;
  ListGroup:=[];
  ListSample:=[];
  while(true)
  do
    p4:=2;
    p5:=8;
    p6:=nb;
    ListPair:=[[4,p4], [5,p5], [6,p6]];
    nbV:=(4*p4 + 5*p5 + 6*p6)/3;
    LPL:=GetList3valentPlaneGraphSpecifiedFvector(nbV, ListPair);
    for ePL in LPL
    do
      ePLd:=DualGraph(ePL).PlanGraph;
      ListDeg:=List(ePLd, Length);
      ListPos:=Filtered([1..Length(ListDeg)], x->ListDeg[x]=4);
      pos3:=ListPos[1];
      pos4:=ListPos[2];
      pos:=Position(ePLd[pos3], pos4);
      if pos<>fail then
        eGRP:=GroupPlan(ePLd).SchoenfliesSymbol;
        posGRP:=Position(ListGroup, eGRP);
        if posGRP=fail then
          Add(ListGroup, eGRP);
          Add(ListSample, ePL);
        fi;
      fi;
      Print("ListGroup=", ListGroup, "\n");
    od;
    nb:=nb+1;
  od;
fi;
