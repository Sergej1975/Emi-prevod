///////////////////////////////////////////////////////////////////////////////
//
//  Class code created by the Xbase++ FormDesigner
//    Creation date: 18-12-23 Creation time: 09:06:04
//
//  Contents  :
//    This file contains the basic structure for the utilization-level of
//    a form. It may (and should) be modified.
//
///////////////////////////////////////////////////////////////////////////////

#include "Gra.ch"
#include "Xbp.ch"
#include "Common.ch"
#include "Appevent.ch"
#include "Font.ch"


******************************************************************************
* This class is derived from the implementation-level class of the form.
* Instance variables are declared in the _NewForm class.
******************************************************************************
CLASS NewForm FROM _NewForm
   EXPORTED:
      METHOD init
      METHOD create
ENDCLASS

******************************************************************************
* Initialize form
******************************************************************************
METHOD NewForm:init( oParent, oOwner, aPos, aSize, aPP, lVisible )

   * Execute method of the super class
   ::_NewForm:init( oParent, oOwner, aPos, aSize, aPP, lVisible )

RETURN self


******************************************************************************
* Request system resources
******************************************************************************
METHOD NewForm:create( oParent, oOwner, aPos, aSize, aPP, lVisible )

   * Execute method of the super class
   ::_NewForm:create( oParent, oOwner, aPos, aSize, aPP, lVisible )


   * Display the form
   ::show()

RETURN self


******************************************************************************
* Main procedure to test a form
******************************************************************************
PROCEDURE Main

   LOCAL nEvent, oXbp, mp1, mp2

   NewForm():New():Create()

   nEvent := xbe_None
   WHILE nEvent != xbeP_Close
      nEvent := AppEvent ( @mp1, @mp2, @oXbp )
      oXbp:HandleEvent ( nEvent, mp1, mp2 ) 
      IF nEvent == xbeP_Quit
         QUIT   // AppQuit()
      ENDIF
   ENDDO

RETURN

* Include program code for the implementation-level class of the form
#include "_EMIII.PRG"

//EOF
/////