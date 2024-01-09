///////////////////////////////////////////////////////////////////////////////
//
//  Function-oriented code created by the Xbase++ FormDesigner
//    Creation date: 18-12-23 Time: 08:36:24
//
///////////////////////////////////////////////////////////////////////////////

#include "Gra.ch"
#include "Xbp.ch"
#include "Appevent.ch"
#include "Font.ch"

#PRAGMA LIBRARY( "ASCOM10.LIB" )

PROCEDURE Main
   LOCAL nEvent, mp1, mp2, aSize
   LOCAL oDlg, oXbp, drawingArea, aEditControls := {}

   IF IsMemberVar(XbpDialog(),"ClientSize") == .T.
      aSize := {0,0}
   ELSE
      aSize := {600,400}
   ENDIF
   
   oDlg := XbpDialog():new( AppDesktop(), , {777,460}, aSize, , .F.)
   IF aSize[1] == 0 .AND. aSize[2] == 0
      oDlg:ClientSize := {584,361}
   ENDIF
   oDlg:taskList := .T.
   oDlg:title := "New form"
   oDlg:create()

   drawingArea := oDlg:drawingArea
   drawingArea:setFontCompoundName( "8.Arial" )

   oXbp := XbpPushButton():new( drawingArea, , {108,108}, {96,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "Pushbutton"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| NIL }

   oXbp := XbpPushButton():new( drawingArea, , {276,108}, {96,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "Pushbutton"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| NIL }

   oDlg:show()
   SetAppFocus(oDlg)

   nEvent := xbe_None
   DO WHILE nEvent <> xbeP_Close
      nEvent := AppEvent( @mp1, @mp2, @oXbp )
      oXbp:handleEvent( nEvent, mp1, mp2 )
   ENDDO
RETURN