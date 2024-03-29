#PRAGMA LIBRARY( "ASCOM10.LIB" )
#pragma  library( "XppUi2.LIB" )
#include "xbpget.prg"
#include "xbpgetc.prg"
#include "getcol.prg"
#include "Kirla855.prg"
*#include "Parbuk.prg"
*#include "Radiogrp.prg"
#include "Tooltip.prg"
#include "Appevent.ch"
#include "Appedit.ch"
#include "Appbrow.ch"
#include "Common.ch"
#include "Gra.ch"
#include "Xbp.ch"
#include "Font.ch"
#include "Directry.ch"
#include "DLL.ch"
#include "activex.ch"

#pragma library("XppUi2")

//#PRAGMA LIBRARY( "ASCOM10.LIB" )

PROCEDURE DbeSys
RETURN
PROCEDURE AppSys
   PUBLIC oDlg, oXbp
   PUBLIC redbr, redbre, red, nazive, naziv, izbore, oddatae, dodatae, izbris,  pobare, oBrow
   PUBLIC statuse, primile, izbor, oddata, dodata, pobaruva, primil, zavrseno, oBmp, drawingArea
   PUBLIC nrbr , rbr,  xsifra , redbrI , mizlez , prbr, mizlez

   PUBLIC getList := {}, aTabela := {} , aEditControls := {}

   PUBLIC  aPos[2], aSize, nHeight:=800, nWidth := 1125
   aSize    := SetAppWindow():currentSize()
   aPos[1]  := Int( (aSize[1]-nWidth ) / 2 )
   aPos[2]  := Int( (aSize[2]-nHeight) / 2 )

DbeLoad( "DBFDBE", .T.)
DbeLoad( "NTXDBE", .T.)
DbeBuild( "DBFNTX", "DBFDBE", "NTXDBE" )
DbeSetDefault( "DBFNTX" )

   SET CENTURY ON
   SET EPOCH TO 1990
   SET COLLATION TO ASCII
   SET DATE FORMAT TO "dd.mm.yyyy"


RETURN


PROCEDURE Main
   LOCAL nEvent, mp1, mp2

   //redbrI   = 0
   red      = 0
   redbre   = 0
   izbris     = SPACE(2)
   naziv    = SPACE(40)
   nazive   = SPACE(40)
   oddata   = DATE()
   oddatae  = DATE()
   dodata   = DATE()
   dodatae  = DATE()
   pobaruva = 0
   pobare   = 0
   primil   = 0
   primile  = 0
   zavrseno = SPACE(10)
   statuse  = SPACE(10)
   izbor    = SPACE(10)
   izbore   = SPACE(10)




   SELECT 300
   Otvori("prevodW",.T.)
   ZAP



   APPEND FROM prevod FOR prevod->red != 0
   APPEND BLANK
   nrbr = 1
   DbEval ( {|| Frbr("prevodw")})

   SET FILTER TO prevodw->bris = " "
   //SET FILTER TO !DELETED() //.AND. LEN(ALLTRIM(prevod->naziv))>0
   GOTO BOTTOM
   GOTO TOP

   // nrbr = 1
  // DbEval ( {|| Frbr("prevodw"),DodTab(aTabela,prevodW->red) } )



   FOR i = 1 TO LEN(getList)
        getList[i]:setData()
   NEXT



   oDlg := XbpDialog():new(,, aPos, {nWidth, nHeight},, .F. )
   oDlg:taskList := .T.
   oDlg:icon:= 203
   oDlg:title := "�ҷ ���֦"
   oDlg:create()

   drawingArea := oDlg:drawingArea
   drawingArea:setFontCompoundName( "12.Arial Cyr" )




   oBrow := XbpBrowse():new( drawingArea,,{19,550}, {1070,200},, .F. )
   oBrow:setFontCompoundName("12.Arial Cyr")
   oBrow:SetInputFocus := {|u1,u2,o| DbSelectArea(300) }
   oBrow:hScroll := .F.
   oBrow:create()

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->red,'###'),FIELD->red:=x) }" )
   oBrow:addColumn( bBlock,3,"  ��.",,4)

  // bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->redbr,'##########'),FIELD->redbr:=x) }" )
  // oBrow:addColumn( bBlock,3,"��֎",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->izbor,'#######'),FIELD->izbor:=x) }" )
   oBrow:addColumn( bBlock,5,"  ���֦",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->naziv,'######################################'),FIELD->naziv:=x) }" )
   oBrow:addColumn( bBlock,25,"                      ՠ��",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->oddata,'#######'),FIELD->oddata:=x) }" )
   oBrow:addColumn( bBlock,6,"    צ ���",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->dodata,'#######'),FIELD->dodata:=x) }" )
   oBrow:addColumn( bBlock,6,"  �� ���",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->pobaruva,'##########'),FIELD->pobaruva:=x) }" )
   oBrow:addColumn( bBlock,7,"   �֢����",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->primil,'##########'),FIELD->primil:=x) }" )
   oBrow:addColumn( bBlock,7,"   ��ҷ�",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->zavrseno,'##########'),FIELD->zavrseno:=x) }" )
   oBrow:addColumn( bBlock,7,"       �����",,4)





   oBrow:skipBlock     := {|n| DbSkipper(n) }
   oBrow:goTopBlock    := {| | DbGoTop()    }
   oBrow:goBottomBlock := {| | DbGoBottom() }
   oBrow:phyPosBlock   := {| | Recno()      }


// �֦Է ������ � ���Ơ��� ������렒�
 //  oBrow:posBlock      := {| | OrdKeyNo()   }
   oBrow:posBlock      := {| | Recno()   }
   oBrow:lastPosBlock  := {| | LASTREC() }
   oBrow:firstPosBlock := {| | 1         }


// ����᠎ ���Ƥ���: Entr() ��Ơ�� �� �� ���� ��֬�� (ENTER �з 2�з�)
   oBrow:itemMarked  := {| | Entrg(oBrow) }
   oBrow:cursorMode  := 3
   //oBrow:refreshall()
   oBrow:forceStable()
   oBrow:show()


   oBmp:= XbpStatic():new(drawingArea, , {14,14}, {20,160} )
   oBmp:type := XBPSTATIC_TYPE_BITMAP
   oBmp:clipSiblings := .T.
   oBmp:caption := 201
   oBmp:autoSize := .T.
   oBmp:create()


   oXbp := XbpGET():new( drawingArea, , {18,513}, {52,24} )
   oXbp:clipSiblings:=.T.
   oXbp:tabStop := .T.
   oXbp:picture      := "###"
   oXbp:editable     := .F.

   oXbp:Datalink      := { |x| IIF( PCOUNT()==0,redbre, redbre:=x )}
   //oXbp:killInputFocus := {|u1,u2,o| o:getData(),o:setData()}
   oXbp:create()
   //oXbp:setData()
   AAdd( getList, oXbp )


   oXbp := XbpGET():new( drawingArea, , {71,513}, {82,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings:=.T.
   oXbp:align:= XBPSLE_CENTER
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0,izbore, izbore:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

  // oXbp := XbpGET():new( drawingArea, , {73,415}, {81,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
  // oXbp:clipSiblings:=.T.
  // oXbp:tabStop := .T.
  // oXbp:Datalink      := { |x| IIF( PCOUNT()==0,redbrI, redbrI:=x )}
  // oXbp:create()
  // AAdd( getList, oXbp )

   oXbp := XbpGET():new( drawingArea, , {154,513}, {383,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings:=.T.
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0,nazive, nazive:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   oXbp := XbpGET():new( drawingArea, , {538,513}, {97,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings:=.T.
   oXbp:tabStop := .T.
   //oXbp:align:= XBPSLE_CENTER
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0,oddatae, oddatae:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   oXbp := XbpGET():new( drawingArea, , {636,513}, {97,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings:=.T.
   oXbp:tabStop := .T.
   //oXbp:align:= XBPSLE_CENTER
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0,dodatae, dodatae:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   oXbp := XbpGET():new( drawingArea, , {734,513}, {112,24} )
   oXbp:clipSiblings:=.T.
   oXbp:tabStop := .T.
   oXbp:align:= XBPSLE_LEFT
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0,pobare, pobare:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   oXbp := XbpGET():new( drawingArea, , {847,513}, {112,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings:=.T.
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0,primile, primile:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   oXbp := XbpGET():new( drawingArea, , {960,513}, {112,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings:=.T.
   oXbp:tabStop := .T.
   oXbp:align:= XBPSLE_CENTER
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0,statuse, statuse:=x )}
   oXbp:create()
   AAdd( getList, oXbp )



   oXbp := XbpPushButton():new( drawingArea, , {71,478}, {81,24},  )
   oXbp:caption := "���֦"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Izbor() }

   oXbp := XbpPushButton():new( drawingArea, , {73,35}, {96,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "����᠒�"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| AzuPR(oBrow) }

   oXbp := XbpPushButton():new( drawingArea, , {210,35}, {96,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "������"
   oXbp:clipsiblings := .T.
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Bripr(oBrow) }

   oXbp := XbpPushButton():new( drawingArea, , {340,35}, {96,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "����ᦠ"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| GotovPR() }

   oXbp := XbpPushButton():new( drawingArea, , {960,478}, {112,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "�����"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Status() }

   oXbp := XbpPushButton():new( drawingArea, , {962, 35}, {112,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "��Ш�"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| IzlezPR() }



   SetAppWindow( oDlg )

   SetAppFocus(oBrow)

   //AEval(getList, {|o| o:setData() })

   //SetAppFocus( getList[1] )

   oCtrl := XbpGetController():new( oDlg )
   oCtrl:create()
   oDlg:close := {|| oCtrl:killRead() }

   oCtrl:read( ,.F. )

   nEvent := xbe_None
   DO WHILE nEvent <> xbeP_Close
      nEvent := AppEvent( @mp1, @mp2, @oXbp )
      oXbp:handleEvent( nEvent, mp1, mp2 )
   ENDDO

RETURN





///izbor na tip na prevod




//////////////////////////////////////////////////////
/////////////////////////////////////////////////////
///////////brisenje slogovi///////////////////////////////////////



******************************************
*** SIFRARNIK ZA POTEKLO NA MOSTRATA    **
******************************************
/*FUNCTION Funk11e()
LOCAL trrr
   IF aktivno = .F.
      aktivno = .T.
   ELSE
      RETURN nil
   ENDIF

   PUBLIC oD11, getList := {}, aTabela := {}

   mizlez = .F.

   odstrana = 1
   dostrana = 0

   mrbr  = 0
   msifnal = 0
   mnaznal = SPACE(25)

   CLOSE 10
   SELECT 100
   Otvori(mdir3+"bri10w",.T.)
   ZAP

   APPEND FROM bri10 FOR bri10->bris = " " .AND. bri10->sifnal <> 0   // eden inicijalen slog so 0 e potreben i ne se nudi za azuriranje
   APPEND BLANK
   nrbr = 1
   DbEval ( {|| Frbr("bri10w"),DodTab(aTabela,bri10w->sifnal) } )

   SET FILTER TO bri10w->bris = " "
   GOTO BOTTOM
   GOTO TOP

   oD11           := XbpDialog():new( trrr, , {10,10}, {1100,670} )
   oD11:title     := "1.1. ���� ա ա�׭ �� ��ӡ�� ա ���� � �����"
   oD11:taskList  := .T.
   oD11:icon      := 110
   oD11:close     := {|mp1,mp2,obj| aktivno := .F., Izlez11()}
   oD11:maxButton := .T.
   oD11:minButton := .F.
   oD11:border    := 12
   oD11:create()

// ��з��� � �Ҩ���렠� ��: dravingArea
   oNov := oD11:drawingArea
   oD11:drawingArea:setColorBG( 15 )

// ՠ ��֎ Ԡ��� � ����Ҡ "���" Ơ�� ƨ ����� ��ط���Է ���Ʒ�
   oPS := XbpPresSpace():new()
   oPS:create(oNov:winDevice())
   oNov:setFontCompoundName( "12.Courier New Cyr" )

// ZNAKOT: OD TUKA
// oLogo = xbpStatic():new(oNov,,{5,428},{36,52})
// oLogo:type = XBPSTATIC_TYPE_BITMAP
// oLogo:caption = 209
// oLogo:create()
// ZNAKOT: DO TUKA
//-----------------------------------------------------------------
   oBrow := XbpBrowse():new( oNov,,{400,85}, {355,500},, .F. ):create()
   oBrow:setFontCompoundName("12.Courier New Cyr")
   oBrow:setInputFocus := {|u1,u2,o| DbSelectArea(100) }

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->rbr,'###'),FIELD->rbr:=x) }" )
   oBrow:addColumn( bBlock,3,"��",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->sifnal,'###'),FIELD->sifnal:=x) }" )
   oBrow:addColumn( bBlock,3,"���",,4)

   bBlock := &( "{|x| IIf(x==NIL,FIELD->naznal,FIELD->naznal:=x) }" )
   oBrow:addColumn( bBlock,25,"�� Ԡ Ԡ�֬",,4)

//-----------------------------------------------------------------
// �֦Է ������ � ��騒�. ����� � ط��� ��� �Ơ - � � ���Ш!
   oBrow:skipBlock     := {|n| DbSkipper(n) }
   oBrow:goTopBlock    := {| | DbGoTop()    }
   oBrow:goBottomBlock := {| | DbGoBottom() }
   oBrow:phyPosBlock   := {| | Recno()      }

// �֦Է ������ � ���Ơ��� ������렒�
//   oBrow:posBlock      := {| | OrdKeyNo()   }
   oBrow:posBlock      := {| | Recno()   }
   oBrow:lastPosBlock  := {| | LASTREC() }
   oBrow:firstPosBlock := {| | 1         }

// ����᠎ ���Ƥ���: Entr() ��Ơ�� �� �� ���� ��֬�� (ENTER �з 2�з�)
   oBrow:itemMarked  := {| | Entr11(oBrow)  }
   oBrow:cursorMode    := 3
   oBrow:forceStable()
   oBrow:show()
//-----------------------------------------------------------------

   oXbp := XbpGET():new( oNov, , {438,60}, {37,20}       )
   oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:picture      := "#"
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0, msifnal, msifnal:=x )}
   oXbp:create()
   AAdd( getList, oXbp )      // 1.

   oXbp := XbpGET():new( oNov, , {476,60}, {260,20})
   oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:bufferLength := 25
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0, mnaznal, mnaznal:=x )}
//   oXbp:killInputFocus := { |u1,u2,o| o:getdata(), mnaznal :=Lat2Kir(mnaznal,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )   // 2.

//-----------------------------------------------------------------
// ako e za ISI da ne bidat vidlivi
   IF mpriv = "x" //.AND. xprogram <> "MHVEKS"  // ako e U ima privilegii za azuriranje i zapis
      oXbs = xbpPushbutton():new(oNov,,{450,6},{100,20})
      oXbs:setFontCompoundName("12.Arial Cyr")
      oXbs:caption = "����᠎"
      oXbs:tabStop      := .T.
      oXbs:clipSiblings := .T.
      oXbs:activate     := {|| Azu11(oBrow)}
      oXbs:create()

      oXbs = xbpPushbutton():new(oNov,,{560,6},{100,20})
      oXbs:setFontCompoundName("12.Arial Cyr")
      oXbs:caption = "����"
      oXbs:tabStop      := .T.
      oXbs:clipSiblings := .T.
      oXbs:activate     := {|| Bri11(oBrow)}
      oXbs:create()

      oXbp:=xbpPushbutton():new(oNov,,{900,10},{44,44})
      oXbp:caption = 205             // kluc.bmp 40x40
      oXbp:tabStop      := .T.
      oXbp:clipSiblings := .T.
      oXbp:activate     := {|| Gotov11() }
      oXbp:create()
   ENDIF

   oXbpri := xbpPushbutton():new(oNov,,{6,8},{40,40})
   oXbpri:caption = 208             // printer.bmp 40x40
   oXbpri:tabStop      := .T.
   oXbpri:clipSiblings := .T.
   oXbpri:activate     := {|| Lista11(),Otpecati()}
   oXbpri:create()
/*
   oXls:= xbpPushbutton():new(oNov,,{110,10},{40,40},,.F.)
   oXls:caption = 302
   oXls:tabStop      := .T.
   oXls:clipSiblings := .T.
   oXls:show()
   oXls:setFontCompoundName("11.Arial Cyr")
   oXls:activate     := {|| Lista11xls()}
// �� ᨠ��� � Ԡ ENTER:
/// nesto bas i ne reagira
   oXls:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         PostAppEvent( xbeP_Activate,,, obj ), NIL ) }
   oXls:create()

   oXbp := XbpGET():new( oNov, , {400,60}, {37,20}       )
   oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:picture      := "###"
   oXbp:editable     := .F.
   oXbp:preBlock     := {|| .F. }
   oXbp:Datalink     := { |x| IIF( PCOUNT()==0, mrbr, mrbr:=x )}
   oXbp:create()
   AAdd( getList, oXbp )      // 4.

   oXbp:=xbpPushbutton():new(oNov,,{1034,8},{46,60})
   oXbp:caption = 206             // vrata.bmp 36x54
   oXbp:tabStop      := .T.
   oXbp:clipSiblings := .T.
   oXbp:activate     := {|| Izlez11() }
   oXbp:create()
//-----------------------------------------------------------------
   SetAppFocus( getList[1] )

   oCtrl := XbpGetController():new( oD11 )
   oCtrl:create()
   oD11:close := {|| oCtrl:killRead() }

   oCtrl:read( ,.F. )

   FOR i = 1 TO LEN(getList)
      getList[i]:setData()
   NEXT
RETURN nil

*******************************
FUNCTION Entr11e(oBrow)
LOCAL i
   SELECT 100
   mrbr    = bri10w->rbr
   msifnal = bri10w->sifnal
   mnaznal = bri10w->naznal

   IF msifnal == 0
      getList[1]:editable := .T.
      getList[1]:configure()
      SetAppFocus( getList[1] )
   ELSE
      getList[1]:editable := .F.
      getList[1]:configure()
      SetAppFocus( getList[2] )
   ENDIF

   oBrow:forceStable()
   oBrow:refreshAll()

   FOR i = 1 TO LEN(getList)
      getList[i]:setData()
   NEXT
RETURN nil

***********************
* AZURIRANJE SIFRI    *
***********************
FUNCTION Azu11e(oBrow)
LOCAL i, slog, pslog, ima
   SELECT 100
   FOR i = 1 TO LEN(getList)
      getList[i]:getData()
   NEXT

///////////////////////////////////////////////////////////////////////
   IF msifnal == 0
      MsgBox("ըҠ� �Ԩ��� ���� � Ԡ�֬","���Ơ � ���Ơ!")
      KEYBOARD CHR(24) + CHR(5)
      SetAppFocus( getList[1] )
      RETURN nil
   ENDIF

   IF mnaznal == SPACE(20)
      MsgBox("ըҠ� �Ԩ��� Ԡ�� Ԡ Ԡ�֬","���Ơ � ���Ơ!")
      KEYBOARD CHR(24) + CHR(5)
      SetAppFocus( getList[2] )
      RETURN nil
   ENDIF

///////////////////////////////////////////////////////////////////////
   slog = RECNO()

   IF slog = LASTREC()
      pslog = .T.
   ELSE
      pslog = .F.
   ENDIF

   ima = BarTab(aTabela,msifnal)

   IF ima = .F.
      DodTab(aTabela,msifnal)
   ELSE
      IF pslog = .T.
         ConfirmBox(oNov,"����� � Ԡ�֬�� � �Ԩ�Ԡ", ;
                         "���Ơ � ���Ơ!",  ;
                          XBPMB_OK,XBPMB_WARNING)
         KEYBOARD CHR(24) + CHR(5)
         SetAppFocus( getList[1] )
         RETURN nil
      ENDIF
   ENDIF
   REPLACE bri10w->sifnal WITH msifnal, ;
           bri10w->naznal WITH mnaznal

   IF pslog = .T.
      GOTO BOTTOM
      APPEND BLANK
      nrbr = 1
      DbEval ( {|| Frbr("bri10w") } )    // sreduvanje na redni broevi (po dodavanje na nov slog)
      GOTO slog
      oBrow:down()
   ENDIF

   mizlez = .T.

   Entr11(oBrow)

RETURN nil
**************************
*** BRISENJE SIFRI     ***
**************************
FUNCTION Bri11e(oBrow)
LOCAL odg, slog
   IF RECNO() == LASTREC()
      RETURN nil
   ENDIF
   odg = ConfirmBox( ,"��з Ԡ���Ԡ �� ����� �����:" + CHR(13) + ;
                       STR(mrbr,2) + ". " + STR(msifnal,1) + " - " + ALLTRIM(mnaznal) , ;
                      "������ ���� Ԡ Ԡ�֬",  ;
                       XBPMB_YESNO,   ;
                       XBPMB_QUESTION )
   IF odg = XBPMB_RET_NO
      KEYBOARD CHR(24)+CHR(5)
///// SetAppFocus( getList[1] )
      RETURN nil
   ELSE

      BriTab(aTabela,bri10w->sifnal)   // izbrisi sifra od tabela

      REPLACE bri10w->bris WITH "*"

      nrbr = 1
      DbEval ( {|| Frbr("bri10w") } )
      LOCATE FOR bri10w->rbr == mrbr

      mizlez = .T.

      KEYBOARD CHR(24)+CHR(5)
      Entr11(oBrow)

   ENDIF
RETURN nil
***************************************************
*** FUNKCIJA ZA ZAPIS NA ISPRAVNO VNESENI SIFRI ***
***************************************************
FUNCTION Gotov11e()
   IF mizlez = .F.
      RETURN nil
   ENDIF

   SELECT 10
   Otvori("bri10",.F.)

   CLOSE 100
   SELECT 100
   Otvori(mdir3+"bri10w",.T.)
   DO WHILE !EOF()
      msifnal = bri10w->sifnal
      IF msifnal <> 0
         SELECT 10
         LOCATE FOR msifnal = bri10->sifnal
         IF !FOUND()
            APPEND BLANK
            REPLACE bri10->sifnal   WITH msifnal
         ENDIF
         IF RLOCK()
            REPLACE bri10->naznal  WITH bri10w->naznal, ;
                    bri10->bris    WITH bri10w->bris, bri10->rbr WITH bri10w->rbr ,;
                    bri10->korisn  WITH mkorisn
         ENDIF
         SELECT 100
      ENDIF
      SKIP
   ENDDO
   CLOSE 10
   mizlez = .F.
   Izlez11()
RETURN nil

*****************************************************************
*** PRAVI LISTA  - PECATENJE SIFRARNIK ZA POTEKLO              **
****************e*************************************************
FUNCTION Lista11e()
LOCAL sele, slog
   sele = SELECT()
   slog = RECNO()
   SELECT 66
   Otvori(mdir3+"nodlst",.T.)
   ZAP

   gol_lst = 80
   mstra    = 1
   odstrana = 1
   dostrana = 0
   mrbr = 0

   SELECT 100
   GOTO TOP
   Zagl11()
   DO WHILE !EOF()
      IF bri10w->sifnal <> 0 .AND. bri10w->bris = " "
         IF M->bred > 65
            SELECT 66
            APPEND BLANK
            nodlst->esc = ""
            Zagl11()
         ENDIF
         mrbr = mrbr + 1
         SELECT 66
         APPEND BLANK
         bred = bred + 1
         nodlst->txt = SPACE(5) + STR(mrbr,3) + "       " + STR(bri10w->sifnal,1)  + "         " + ;
                       bri10w->naznal
         SELECT 100
      ENDIF
      SKIP
   ENDDO
   SELECT 66
   APPEND BLANK
   nodlst->esc = "%-12345X"
   SELECT(sele)
   GOTO slog
RETURN nil
****************
*** ZAGLAVIE ***
****************
FUNCTION Zagl11e()
   dostrana = dostrana + 1
   SELECT 66
   APPEND BLANK
   nodlst->esc  = "(71X"
   nodlst->txt = SPACE(5) + mnaziv1 + SPACE(35) + "Ӷ��11"
   APPEND BLANK
   nodlst->txt = SPACE(5) + mnaziv2 + SPACE(35) + "���." + STR(mstra,2)
   APPEND BLANK
   APPEND BLANK
   nodlst->esc  = "(71X"
   nodlst->txt = SPACE(36) + "�� ա ա���� �� ��ӡ�� ա �����"
   APPEND BLANK
   APPEND BLANK
   nodlst->esc  = "(70X"
   nodlst->txt  = SPACE(5) + REPLICATE("*",66)
   APPEND BLANK
   nodlst->esc  = "(71X"
   nodlst->txt  = SPACE(5) + "��       ����     ՠ�� Ԡ Ԡ�֬"
   APPEND BLANK
   nodlst->esc  = "(70X"
   nodlst->txt  = SPACE(5) + REPLICATE("*",66)
   M->bred = 8
   mstra = mstra + 1
RETURN nil

FUNCTION Lista11xls()
  LOCAL oExcel, oBook, oSheet
  LOCAL cDir, nRow

  // Create the "Excel.Application" object
  oExcel := CreateObject("Excel.Application")
  IF Empty( oExcel )
    MsgBox( "Excel is not installed" )
    RETURN nil
  ENDIF

  // Avoid message boxes such as "File already exists". Also,
  // ensure the Excel application is visible.
  oExcel:DisplayAlerts := .F.
  oExcel:visible       := .T.

//cDir := CurDrive()+":\"+CurDir()
  mrbr = 0
  nRow = 7
  cDir := "C:\MIKROHIV"
  oBook  := oExcel:workbooks:Open(cDir + "\urnek_012.xls")
  oSheet := oBook:ActiveSheet
  oSheet:PageSetup:Orientation := xlLandscape


  SELECT 100
   GOTO TOP
   DO WHILE !EOF()
      IF bri10w->sifnal <> 0 .AND. bri10w->bris = " "
         mrbr = mrbr + 1
         nRow = nRow + 1
         oSheet:Cells(nRow,1):Value := STR(mrbr,3)
         oSheet:Cells(nRow,2):Value := STR(bri10w->sifnal,1)
         oSheet:Cells(nRow,3):Value := bri10w->naznal
         SELECT 100
      ENDIF
      SKIP
   ENDDO

// Save workbook as ordinary excel file.
  oBook:SaveAs(cDir+"\Lista12.xls",xlWorkbookNormal)

  oExcel:Quit()
  oExcel:Destroy()
//RUNSHELL("/C START EXCEL.EXE dato811.xls",, .F.)
  RUNSHELL("/C START EXCEL.EXE " + cDir +"\Lista12.xls",, .F.)
// MsgBox("��Ш��� � Ԡւ� ��: " + cDir +"\dato811.xls")
RETURN nil
**************
*** IZLEZI ***
**************
FUNCTION Izlez11e()
   IF mizlez = .T.
      odg = ConfirmBox( ,"�Ҡ� ����Ԡ�� �� ᠢ��." + CHR(13) + ;
                         "��з Ԡ���Ԡ �� ��Ʒ����?" , ;
                         "�ԷҠԷ�!", ;
                         XBPMB_YESNO,   ;
                         XBPMB_QUESTION )
      IF odg = XBPMB_RET_NO
         KEYBOARD CHR(24)+CHR(5)
         SetAppFocus( getList[1] )
         RETURN nil
      ENDIF
   ENDIF
   Zatvor()
   oD11:destroy()
RETURN nil           */