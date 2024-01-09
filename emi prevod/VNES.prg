FUNCTION Vnes()
PUBLIC oBmp
   oBrow := XbpBrowse():new( drawingArea,,{23,550}, {1085,200},, .F. )
   oBrow:setFontCompoundName("12.Courier New Cyr")
   oBrow:KillInputFocus := {|u1,u2,o| DbSelectArea(300) }
   oBrow:hScroll := .F.
   oBrow:create()

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->redbr,'###'),FIELD->redbr:=x) }" )
   oBrow:addColumn( bBlock,3,"��֎",,4)

   //bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->bris,'##########'),FIELD->bris:=x) }" )
  // oBrow:addColumn( bBlock,10,"��׸��ק���",,4)
   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->izbor,'#######'),FIELD->izbor:=x) }" )
   oBrow:addColumn( bBlock,10,"����",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->naziv,'#######'),FIELD->naziv:=x) }" )
   oBrow:addColumn( bBlock,40,"ՠ��",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->oddata,'#######'),FIELD->oddata:=x) }" )
   oBrow:addColumn( bBlock,10,"צ ���",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->dodata,'#######'),FIELD->dodata:=x) }" )
   oBrow:addColumn( bBlock,10,"�� ���",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->pobaruva,'##########'),FIELD->pobaruva:=x) }" )
   oBrow:addColumn( bBlock,10,"�֢����",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->primil,'##########'),FIELD->primil:=x) }" )
   oBrow:addColumn( bBlock,10,"��ҷ�",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->zavrseno,'##########'),FIELD->zavrseno:=x) }" )
   oBrow:addColumn( bBlock,5,"�����",,4)


   oBrow:skipBlock     := {|n| DbSkipper(n) }
   oBrow:goTopBlock    := {| | DbGoTop()    }
   oBrow:goBottomBlock := {| | DbGoBottom() }
   oBrow:phyPosBlock   := {| | Recno()      }

// �֦Է ������ � ���Ơ��� ������렒�
   oBrow:posBlock      := {| | OrdKeyNo()   }
   oBrow:posBlock      := {| | Recno()   }
   oBrow:lastPosBlock  := {| | LASTREC() }
   oBrow:firstPosBlock := {| | 1         }


// ����᠎ ���Ƥ���: Entr() ��Ơ�� �� �� ���� ��֬�� (ENTER �з 2�з�)
   oBrow:itemMarked  := {| | Entrg(oBrow) }
   oBrow:cursorMode  := 3
   oBrow:forceStable()
   oBrow:show()

   oBmp:= XbpStatic():new(drawingArea, , {15,15}, {160,160} )
   oBmp:type := XBPSTATIC_TYPE_BITMAP
   oBmp:clipSiblings := .T.
   oBmp:caption := 201
   oBmp:autoSize := .T.
   oBmp:create()


   oXbp := XbpGET():new( drawingArea, , {25,515}, {44,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings:=.T.
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0,redbre, redbre:=x )}
   //oXbp:killInputFocus := {|u1,u2,o| o:getData(),o:setData()}
   oXbp:create()
   //oXbp:setData()
   AAdd( getList, oXbp )


   oXbp := XbpGET():new( drawingArea, , {73,515}, {105,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings:=.T.
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0,izbore, izbore:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   oXbp := XbpGET():new( drawingArea, , {180,515}, {405,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings:=.T.
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0,nazive, nazive:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   oXbp := XbpGET():new( drawingArea, , {589,515}, {105,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings:=.T.
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0,oddatae, dodatae:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   oXbp := XbpGET():new( drawingArea, , {697,515}, {105,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings:=.T.
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0,dodatae, dodatae:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   oXbp := XbpGET():new( drawingArea, , {804,515}, {105,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings:=.T.
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0,pobare, pobare:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   oXbp := XbpGET():new( drawingArea, , {913,515}, {105,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings:=.T.
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0,primile, primile:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   oXbp := XbpGET():new( drawingArea, , {1022,515}, {68,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings:=.T.
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0,statuse, statuse:=x )}
   oXbp:create()
   AAdd( getList, oXbp )



   oXbp := XbpPushButton():new( drawingArea, , {73,481}, {105,24},  )
   oXbp:caption := "�� Ԡ ���֦"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Izbor() }

   oXbp := XbpPushButton():new( drawingArea, , {73,35}, {96,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "��� �Ԩ�"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| NIL }

   oXbp := XbpPushButton():new( drawingArea, , {210,35}, {96,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "������"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| NIL }

   oXbp := XbpPushButton():new( drawingArea, , {340,35}, {96,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "����᠒�"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| NIL }

   oXbp := XbpPushButton():new( drawingArea, , {470,35}, {96,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "����ᦷ"
   oXbp:tabStop := .T.
   oXbp:create()

   oXbp := XbpPushButton():new( drawingArea, , {1022,481}, {70,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "�����"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Status() }

   oXbp := XbpPushButton():new( drawingArea, , {1022,35}, {70,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "��Ш�"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Zatvori(), oDlg:destroy() }

RETURN
