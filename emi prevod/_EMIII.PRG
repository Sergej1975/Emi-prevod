///////////////////////////////////////////////////////////////////////////////
//
//  Class code created by the Xbase++ FormDesigner
//    Creation date: 18-12-23 Creation time: 09:06:04
//
//  Contents  :
//    This file contains the implementation level of a form and is
//    overwritten automatically by the Xbase++ Form Designer.
//    Be careful when modifying this file since changes may get lost.
//
///////////////////////////////////////////////////////////////////////////////

#ifndef _NEWFORM_
#define _NEWFORM_

#include "Gra.ch"
#include "Xbp.ch"
#include "Common.ch"
#include "Appevent.ch"
#include "Font.ch"

#PRAGMA LIBRARY( "ASCOM10.LIB" )

CLASS _NewForm FROM XbpDialog
   EXPORTED:
      VAR editControls

      * Contained control elements
      VAR PushButton1
      VAR PushButton2

      METHOD init
      METHOD create
ENDCLASS

******************************************************************************
* Initialize form
******************************************************************************
METHOD _NewForm:init( oParent, oOwner, aPos, aSize, aPP, lVisible )


   DEFAULT oParent  TO AppDesktop(), ;
           aPos     TO {777,460}, ;
           lVisible TO .F.

   DEFAULT aPP TO {}
   AAdd ( aPP, { XBP_PP_COMPOUNDNAME, "8.Arial" } )
   
   IF Empty(aSize) == .T.
      IF IsMemberVar(self,"ClientSize") == .T.
         aSize := {0,0}
      ELSE
         aSize := {600,400}
      ENDIF
   ENDIF
   
   ::XbpDialog:init( oParent, oOwner, aPos, aSize, aPP, lVisible )
   IF aSize[1] == 0 .AND. aSize[2] == 0
      ::XbpDialog:ClientSize := {584,361}
   ENDIF
   ::XbpDialog:taskList := .T.
   ::XbpDialog:title := "New form"

   ::editControls := {}

   ::PushButton1 := XbpPushButton():new( ::drawingArea, , {108,108}, {96,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   ::PushButton1:caption := "Pushbutton"
   ::PushButton1:tabStop := .T.
   ::PushButton1:activate := {|| NIL }

   ::PushButton2 := XbpPushButton():new( ::drawingArea, , {276,108}, {96,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   ::PushButton2:caption := "Pushbutton"
   ::PushButton2:tabStop := .T.
   ::PushButton2:activate := {|| NIL }

RETURN self


******************************************************************************
* Request system resources
******************************************************************************
METHOD _NewForm:create( oParent, oOwner, aPos, aSize, aPP, lVisible )

   ::XbpDialog:create( oParent, oOwner, aPos, aSize, aPP, lVisible )

   ::PushButton1:create()

   ::PushButton2:create()


RETURN self

#endif

//EOF
/////