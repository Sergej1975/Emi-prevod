#include "Appevent.ch"
#include "Common.ch"
#include "Gra.ch"
#include "Xbp.ch"
//#include "Font.ch"
//#include "excel.ch"
///////////////////////////////////////////////////////
FUNCTION Otvori(datot,excl)
LOCAL odg
DO WHILE .T.
   IF excl = .T.
      USE (datot) EXCLUSIVE
   ELSE
      USE (datot) SHARED
   ENDIF
   IF .NOT. NETERR()
      RETURN nil
   ELSE
      odg = ConfirmBox( , "ÝÖû¨Æ Žå¨, ØÖ¦ åÖ¤·å¨ ã¨ ó ª å¨Ô·.", ;
                          "×åë á ’¨: " + datot,                 ;
                           XBPMB_OKCANCEL,                      ;
                           XBPMB_WARNING )
      IF odg = XBPMB_RET_OK
      ELSE
         CLOSE DATABASES

         QUIT
      ENDIF
   ENDIF
ENDDO
RETURN nil
//////////////////////////////////////////////////////
///////////////////////////////////////////////////////
****************************
*** LATINICA VO KIRILICA ***
****************************
FUNCTION Lat2Kir(lat)
LOCAL ii, kir, mat
   mat = SUBSTR(LTRIM(lat) + SPACE(70),1,LEN(lat))
   kir = ""
   FOR ii = 1 TO LEN(lat)
      IF ASC(SUBSTR(mat,ii,1)) < 128
         kir = kir + LatKir855(SUBSTR(mat,ii,1))
      ELSE
         kir = kir + SUBSTR(mat,ii,1)
      ENDIF
   NEXT
RETURN kir
****************************
***  KIRILICA VO LATINICA***
****************************
FUNCTION Kir2Lat(lat)
LOCAL ii, kir, mat
   mat = SUBSTR(LTRIM(lat) + SPACE(70),1,LEN(lat))
   kir = ""
   FOR ii = 1 TO LEN(lat)
      IF ASC(SUBSTR(mat,ii,1)) >= 128
         kir = kir + KirLat855(SUBSTR(mat,ii,1))
      ELSE
         kir = kir + SUBSTR(mat,ii,1)
      ENDIF
   NEXT
RETURN kir

//////////////////////////////////////////
/////////////////////////////////////
FUNCTION Zatvori()
LOCAL odg
 odg = ConfirmBox( ,"ä·¬çáÔÖ?",;
                      "¸óÐ¨ó Ö¦ ØáÖ¬á Ò",  ;
                       XBPMB_YESNO,   ;
                       XBPMB_QUESTION )
   IF odg = XBPMB_RET_NO
      KEYBOARD CHR(24)+CHR(5)
    //  SetAppFocus( getList[1] )
      RETURN nil
   ELSE
   PostAppEvent( xbeP_Close )
//CLOSE DATABASES
   ENDIF
RETURN
///////////////////////////////////////
FUNCTION Frbr(odbaza)
   REPLACE (odbaza)->red WITH nrbr
   nrbr = nrbr + 1

RETURN .T.
///////////////////////////////////////

**********************************************
*** Funkcija za brisenje prevod od tabela**
**********************************************
FUNCTION BriTab(aTabela,xsifra)
LOCAL i
FOR i = 1 TO LEN(aTabela)
   IF aTabela[i] = xsifra
      ADel(aTabela,i)
      EXIT
   ENDIF
NEXT
RETURN nil

**********************************************
*** Funkcija za dodavanje prevod  vo tabela**
**********************************************
FUNCTION DodTab(aTabela,xsifra)
   AAdd(aTabela,xsifra)
RETURN nil

/////////////////////////////////////////
******************************************************
*** BARANJE NA PRETHODNO VNESENA SIFRA NA OPERACIJA **
******************************************************
//FUNCTION BarTab(aTabela,xsifra)
//LOCAL i, mret
//mret = .F.
//FOR i = 1 TO LEN(aTabela)
//   IF aTabela[i] = xsifra
//      mret = .T.
//      EXIT
//   ENDIF
//NEXT
//RETURN mret
////////////////////////////////////////////////

FUNCTION Izbor(x1,y1,x2,y2,poz)
LOCAL i, sele, oBrowaI

   FOR i = 1 TO LEN(getList)
      getList[i]:getData()
   NEXT

   sele = SELECT()

   SELECT 80
   Otvori("izbor",.T.)

   GOTO TOP

   oBrowaI := XbpBrowse():new( drawingArea,,{70, 366}, {82,102},, .F. ):create()
   oBrowaI :hScroll:=.F.
   oBrowaI :vScroll:=.F.
   oBrowaI:setFontCompoundName("12.Arial Cyr")
   oBrowaI:KillInputFocus := {|u1,u2,o| DbSelectArea(80) }


   bBlock := &( "{|x| IIf(x==NIL,FIELD->izbor,FIELD->izbor:=x) }" )
   oBrowaI:addColumn( bBlock,30,"   ¸ó¢Öá",,4)

   // navigation codeblocks for the browser
   oBrowaI:skipBlock     := {|n| DbSkipper(n) }
   oBrowaI:goTopBlock    := {| | DbGoTop()    }
   oBrowaI:goBottomBlock := {| | DbGoBottom() }
   oBrowaI:phyPosBlock   := {| | Recno()      }

  // oBrowaI:posBlock      := {| | OrdKeyNo()     }
   oBrowaI:lastPosBlock  := {| | LASTREC()    }
   oBrowaI:firstPosBlock := {| | 1            }
   oBrowaI:itemSelected  := {| | EnterPodI(oBrowaI,sele,poz)  }
   oBrowaI:cursorMode    := 3
   oBrowaI:forceStable()
   oBrowaI:show()


RETURN nil

FUNCTION EnterPodI(oBrowaI,sele,poz)   //funkcija za izbor na tip na prevod
LOCAL i
   izbore =izbor->izbor

   FOR i = 1 TO LEN(getList)
      getList[i]:setData()
   NEXT
   oBrowaI:destroy()

   SELECT(sele)

   SetAppFocus( getList[1] )

RETURN nil

////////////////////////////////////////////////
//////status na prevod, zavrsen ili ne

FUNCTION Status(x1,y1,x2,y2,poz)
LOCAL i, sele, oBrowaS

   FOR i = 1 TO LEN(getList)
      getList[i]:getData()
   NEXT

   sele = SELECT()

   SELECT 90
   Otvori("status",.T.)
   GOTO TOP

   oBrowaS := XbpBrowse():new( drawingArea,,{960,389}, {110,78},, .F. ):create()
   oBrowaS :hScroll:=.F.
   oBrowaS :vScroll:=.F.
   oBrowaS:setFontCompoundName("12.Arial Cyr")
   oBrowaS:KillInputFocus := {|u1,u2,o| DbSelectArea(90) }


   bBlock := &( "{|x| IIf(x==NIL,FIELD->status,FIELD->status:=x) }" )
   oBrowaS:addColumn( bBlock,30,"¸ó¢Öá",,4)

   // navigation codeblocks for the browser
   oBrowaS:skipBlock     := {|n| DbSkipper(n) }
   oBrowaS:goTopBlock    := {| | DbGoTop()    }
   oBrowaS:goBottomBlock := {| | DbGoBottom() }
   oBrowaS:phyPosBlock   := {| | Recno()      }

  // oBrowaS:posBlock      := {| | OrdKeyNo()     }
   oBrowaS:lastPosBlock  := {| | LASTREC()    }
   oBrowaS:firstPosBlock := {| | 1            }
   oBrowaS:itemSelected  := {| | EnterPodS(oBrowaS,sele,poz)  }
   oBrowaS:cursorMode    := 3
   oBrowaS:forceStable()
   oBrowaS:show()


RETURN nil

FUNCTION EnterPodS(oBrowaS,sele,poz)   //funkcija za izbor na status na prevod
LOCAL i
   statuse =status->status

   FOR i = 1 TO LEN(getList)
      getList[i]:setData()
   NEXT
   oBrowaS:destroy()

   SELECT(sele)

   SetAppFocus( getList[1] )

RETURN nil
//////////////////////////////////////////////////////////////////////
FUNCTION Bripr(oBrow)
LOCAL odg, slog
   IF RECNO() == LASTREC()
      RETURN nil
   ENDIF

   odg = ConfirmBox( ,"§ Ð· Ô ë·ãå·Ô  ¬Ö ¢á·õ¨õ ãÐÖ¬Öå" +  ;
                       STR(redbre,2) + "?" , ;
                      "£á·õ¨’¨ ãÐÖ¬",  ;
                       XBPMB_YESNO,   ;
                       XBPMB_QUESTION )
   IF odg = XBPMB_RET_NO
      KEYBOARD CHR(24)+CHR(5)
    //  SetAppFocus( getList[1] )
      RETURN nil
   ELSE

      BriTab(aTabela,prevodw->red)   // izbrisi sifra od tabela
     // REPLACE prevodw->bris WITH "*"
     DELETE FOR prevodw->red = redbre//=RECNO()
     PACK
     msgbox("¸ó¢á·õ Ô ãÐÖ¬ ¢á:"+ STR(redbre))

      nrbr = 1
      DbEval ( {|| Frbr("prevodw") } )
   //   LOCATE FOR prevodw->red == redbre


      mizlez = .T.

      KEYBOARD CHR(24)+CHR(5)
      // AzuPR(oBrow)
      Entrg(oBrow)
      GotovPR() //<<- morav vaka zatoa sto bez ova ne moze da izbrise poveke slogovi bez potvrda pomegju niv
//msgbox("äÐÖ¬Öå ¨ ·ó¢á·õ Ô!")
   ENDIF
RETURN nil
//////////////////////////////////////////////////////
FUNCTION Entrg(oBrow)
LOCAL i

   SELECT 300

   redbre  = prevodW->red
   nazive  = prevodW->naziv
   izbore  = prevodW->izbor
   oddatae = prevodW->oddata
   dodatae = prevodW->dodata
   pobare  = prevodW->pobaruva
   primile = prevodW->primil
   statuse = prevodW->zavrseno

   IF redbre <> 0
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

RETURN NIL

***********************
* AZURIRANJE SIFRI    *
***********************
FUNCTION AzuPR(oBrow)
LOCAL i, slog, pslog, ima
   SELECT 300
   FOR i = 1 TO LEN(getList)
      getList[i]:getData()
   NEXT

   slog = RECNO()

   IF slog = LASTREC()
      pslog = .T.
   ELSE
      pslog = .F.
   ENDIF

   REPLACE prevodW->red WITH redbre , ;
           prevodW->naziv WITH nazive , ;
           prevodW->izbor WITH izbore , ;
           prevodW->oddata WITH oddatae , ;
           prevodW->dodata WITH dodatae , ;
           prevodW->pobaruva WITH pobare , ;
           prevodW->primil WITH primile , ;
           prevodW->zavrseno WITH statuse


   IF pslog = .T.
      GOTO BOTTOM
      APPEND BLANK
      nrbr = 1
      DbEval ( {|| Frbr("prevodw") } )    // sreduvanje na redni broevi (po dodavanje na nov slog)
      GOTO slog
      oBrow:down()
   ENDIF

   mizlez = .T.

   Entrg(oBrow)
msgbox( "ÝÖ¦ åÖ¤·å¨ ó  ¢áÖŽ" + STR(redbre)+ " ã¨  éçá·á Ô·, ÔÖ Ô¨ · ØÖåëá¦¨Ô·!" )

RETURN nil

***************************************************
*** FUNKCIJA ZA ZAPIS NA ISPRAVNO VNESEN PREVOD ***
***************************************************
FUNCTION GotovPR()
   IF mizlez = .F.
      RETURN nil
   ENDIF

   SELECT 100
   Otvori("prevod",.F.)


   SELECT 300
   Otvori("prevodw",.T.)

   DO WHILE !EOF()
      redbre = prevodw->red
      IF redbre <> 0
         SELECT 100
         LOCATE FOR  redbre = prevod->red

         IF !FOUND()
            APPEND BLANK
            REPLACE prevod->red WITH redbre

         ENDIF

         IF RLOCK()
            REPLACE prevod->red  WITH prevodw->red, ;
                    prevod->bris  WITH prevodw->bris    ,;
                    prevod->izbor  WITH prevodw->izbor,;
                    prevod->naziv WITH prevodw->naziv ,;
                    prevod->dodata  WITH prevodw->dodata    ,;
                    prevod->oddata  WITH prevodw->oddata    ,;
                    prevod->pobaruva  WITH prevodw->pobaruva    ,;
                    prevod->primil  WITH prevodw->primil    ,;
                    prevod->zavrseno  WITH prevodw->zavrseno

         ENDIF

         SELECT 300
      ENDIF


      SKIP
   ENDDO

   SELECT 100
   Otvori("prevod",.T.)
   DELETE FOR prevod->red=LASTREC()
   PACK
msgbox("ÝÖ¦ åÖ¤·å¨ ã¨ ØÖåëá¦¨Ô·!")

   CLOSE 100

   mizlez = .F.

   RETURN nil
**************
*** IZLEZI ***
**************
FUNCTION IzlezPR()
   IF mizlez = .T.
      odg = ConfirmBox( ,"ÝÖ¦ åÖ¤·å¨ Ô¨ ã¨ ØÖåëá¦¨Ô·!" + CHR(13) + ;
                         "§ Ð· Ô ë·ãå·Ô  ·óÐ¨¬çë å¨?" , ;
                         "ìÔ·Ò Ô·¨!", ;
                         XBPMB_YESNO,   ;
                         XBPMB_QUESTION )
      IF odg = XBPMB_RET_NO
         KEYBOARD CHR(24)+CHR(5)
         SetAppFocus( getList[1] )
         RETURN nil
      ENDIF
   ENDIF
  Zatvori()
RETURN nil