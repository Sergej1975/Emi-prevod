//////////////////////////////////////////////////////////////////////
//
//     activex.ch
//
//  Copyright:
//     Alaska Software, (c) 1997-2004. All rights reserved.
//
//  Contents :
//     Defines and Definitions frequently used with COM objects.
//
//////////////////////////////////////////////////////////////////////

#ifndef __ACTIVEX_CH__

#ifdef __XPP__
#pragma Library( "ascom10.lib" )
#endif

//////////////////////////////////////////////////////////////////////
// Defines used with function AutomationCtrlContainterAdd()
//////////////////////////////////////////////////////////////////////
#ifdef __LIBRARY_LEVEL__
#define CS_VISIBLE                              0x01
#define CS_SETFOCUS                             0x02
#endif //__LIBRARY_LEVEL__


//////////////////////////////////////////////////////////////////////
//  Standard DISPIDs used with ActiveX Controls
//
//  NOTE: Even though these are publicly defined,
//        support for these interfaces is optional!
//////////////////////////////////////////////////////////////////////
#ifdef __XPP__
#define DISPID_AUTOSIZE                         (-500)
#define DISPID_BACKCOLOR                        (-501)
#define DISPID_BACKSTYLE                        (-502)
#define DISPID_BORDERCOLOR                      (-503)
#define DISPID_BORDERSTYLE                      (-504)
#define DISPID_BORDERWIDTH                      (-505)
#define DISPID_DRAWMODE                         (-507)
#define DISPID_DRAWSTYLE                        (-508)
#define DISPID_DRAWWIDTH                        (-509)
#define DISPID_FILLCOLOR                        (-510)
#define DISPID_FILLSTYLE                        (-511)
#define DISPID_FONT                             (-512)
#define DISPID_FORECOLOR                        (-513)
#define DISPID_ENABLED                          (-514)
#define DISPID_HWND                             (-515)
#define DISPID_TABSTOP                          (-516)
#define DISPID_TEXT                             (-517)
#define DISPID_CAPTION                          (-518)
#define DISPID_BORDERVISIBLE                    (-519)
#define DISPID_APPEARANCE                       (-520)
#define DISPID_MOUSEPOINTER                     (-521)
#define DISPID_MOUSEICON                        (-522)
#define DISPID_PICTURE                          (-523)
#define DISPID_VALID                            (-524)
#define DISPID_READYSTATE                       (-525)
#define DISPID_LISTINDEX                        (-526)
#define DISPID_SELECTED                         (-527)
#define DISPID_LIST                             (-528)
#define DISPID_COLUMN                           (-529)
#define DISPID_LISTCOUNT                        (-531)
#define DISPID_MULTISELECT                      (-532)
#define DISPID_MAXLENGTH                        (-533)
#define DISPID_PASSWORDCHAR                     (-534)
#define DISPID_SCROLLBARS                       (-535)
#define DISPID_WORDWRAP                         (-536)
#define DISPID_MULTILINE                        (-537)
#define DISPID_NUMBEROFROWS                     (-538)
#define DISPID_NUMBEROFCOLUMNS                  (-539)
#define DISPID_DISPLAYSTYLE                     (-540)
#define DISPID_GROUPNAME                        (-541)
#define DISPID_IMEMODE                          (-542)
#define DISPID_ACCELERATOR                      (-543)
#define DISPID_ENTERKEYBEHAVIOR                 (-544)
#define DISPID_TABKEYBEHAVIOR                   (-545)
#define DISPID_SELTEXT                          (-546)
#define DISPID_SELSTART                         (-547)
#define DISPID_SELLENGTH                        (-548)

#define DISPID_REFRESH                          (-550)
#define DISPID_DOCLICK                          (-551)
#define DISPID_ABOUTBOX                         (-552)
#define DISPID_ADDITEM                          (-553)
#define DISPID_CLEAR                            (-554)
#define DISPID_REMOVEITEM                       (-555)

#define DISPID_CLICK                            (-600)
#define DISPID_DBLCLICK                         (-601)
#define DISPID_KEYDOWN                          (-602)
#define DISPID_KEYPRESS                         (-603)
#define DISPID_KEYUP                            (-604)
#define DISPID_MOUSEDOWN                        (-605)
#define DISPID_MOUSEMOVE                        (-606)
#define DISPID_MOUSEUP                          (-607)
#define DISPID_ERROREVENT                       (-608)
#define DISPID_READYSTATECHANGE                 (-609)
#define DISPID_CLICK_VALUE                      (-610)
#define DISPID_RIGHTTOLEFT                      (-611)
#define DISPID_TOPTOBOTTOM                      (-612)
#define DISPID_THIS                             (-613)

#define DISPID_AMBIENT_BACKCOLOR                (-701)
#define DISPID_AMBIENT_DISPLAYNAME              (-702)
#define DISPID_AMBIENT_FONT                     (-703)
#define DISPID_AMBIENT_FORECOLOR                (-704)
#define DISPID_AMBIENT_LOCALEID                 (-705)
#define DISPID_AMBIENT_MESSAGEREFLECT           (-706)
#define DISPID_AMBIENT_SCALEUNITS               (-707)
#define DISPID_AMBIENT_TEXTALIGN                (-708)
#define DISPID_AMBIENT_USERMODE                 (-709)
#define DISPID_AMBIENT_UIDEAD                   (-710)
#define DISPID_AMBIENT_SHOWGRABHANDLES          (-711)
#define DISPID_AMBIENT_SHOWHATCHING             (-712)
#define DISPID_AMBIENT_DISPLAYASDEFAULT         (-713)
#define DISPID_AMBIENT_SUPPORTSMNEMONICS        (-714)
#define DISPID_AMBIENT_AUTOCLIP                 (-715)
#define DISPID_AMBIENT_APPEARANCE               (-716)

#define DISPID_AMBIENT_CODEPAGE                 (-725)
#define DISPID_AMBIENT_PALETTE                  (-726)
#define DISPID_AMBIENT_CHARSET                  (-727)
#define DISPID_AMBIENT_TRANSFERPRIORITY         (-728)

#define DISPID_AMBIENT_RIGHTTOLEFT              (-732)
#define DISPID_AMBIENT_TOPTOBOTTOM              (-733)

#define DISPID_UNKNOWN                          (-1)
#define DISPID_VALUE                            0
#endif // __XPP__

//////////////////////////////////////////////////////////////////////
// Predefined Actions defined for ActiveX Controls
//////////////////////////////////////////////////////////////////////
#ifdef __XPP__
#ifdef __LIBRARY_LEVEL__
#define OLEVERB_PRIMARY                         0
#define OLEVERB_SHOW                            (-1)
#define OLEVERB_OPEN                            (-2)
#define OLEVERB_HIDE                            (-3)
#define OLEVERB_UIACTIVATE                      (-4)
#define OLEVERB_INPLACEACTIVATE                 (-5)
#define OLEVERB_DISCARDUNDOSTATE                (-6)
#define OLEVERB_PROPERTIES                      (-7)
#endif //__LIBRARY_LEVEL__
#endif //__XPP__


//////////////////////////////////////////////////////////////////////
// ActiveX Control Capabilities and Requirements,
// see IVar :ControlFlags
//////////////////////////////////////////////////////////////////////
#ifdef __XPP__
#define OLECTRL_RECOMPOSEONRESIZE               0x1
#define OLECTRL_ONLYICONIC                      0x2
#define OLECTRL_INSERTNOTREPLACE                0x4
#define OLECTRL_STATIC                          0x8
#define OLECTRL_CANTLINKINSIDE                  0x10
#define OLECTRL_CANLINKBYOLE1                   0x20
#define OLECTRL_ISLINKOBJECT                    0x40
#define OLECTRL_INSIDEOUT                       0x80
#define OLECTRL_ACTIVATEWHENVISIBLE             0x100
#define OLECTRL_RENDERINGISDEVICEINDEPENDENT    0x200
#define OLECTRL_INVISIBLEATRUNTIME              0x400
#define OLECTRL_ALWAYSRUN                       0x800
#define OLECTRL_ACTSLIKEBUTTON                  0x1000
#define OLECTRL_ACTSLIKELABEL                   0x2000
#define OLECTRL_NOUIACTIVATE                    0x4000
#define OLECTRL_ALIGNABLE                       0x8000
#define OLECTRL_SIMPLEFRAME                     0x10000
#define OLECTRL_SETCLIENTSITEFIRST              0x20000
#define OLECTRL_IMEMODE                         0x40000
#define OLECTRL_IGNOREACTIVATEWHENVISIBLE       0x80000
#define OLECTRL_WANTSTOMENUMERGE                0x100000
#define OLECTRL_SUPPORTSMULTILEVELUNDO          0x200000
#endif //__XPP__


//////////////////////////////////////////////////////////////////////
// Operating System Message Defines and Definitions
//////////////////////////////////////////////////////////////////////
// Message Identifiers
#ifdef __XPP__
#define WM_NCLBUTTONDOWN                        0x00A1
#define WM_KEYFIRST                             0x0100
#define WM_KEYDOWN                              0x0100
#define WM_KEYUP                                0x0101
#define WM_CHAR                                 0x0102
#define WM_DEADCHAR                             0x0103
#define WM_SYSKEYDOWN                           0x0104
#define WM_SYSKEYUP                             0x0105
#define WM_SYSCHAR                              0x0106
#define WM_SYSDEADCHAR                          0x0107
#define WM_KEYLAST                              0x0108
#define WM_SYSCOMMAND                           0x0112
#define WM_CUT                                  0x0300
#define WM_COPY                                 0x0301
#define WM_PASTE                                0x0302
#define WM_CLEAR                                0x0303
#define WM_UNDO                                 0x0304

#define EM_FORMATRANGE                          0x0439
#define EM_SETTARGETDEVICE                      0x0448
#define EM_LINEINDEX                            0x00BB
#define EM_POSFROMCHAR                          0x0426
#endif //__XPP__

#ifdef __XPP__
// Defines Used with WM_SYSKEYDOWN message
#define SC_SIZE                                 0xF100
#define SC_KEYMENU                              0xF100
#define SC_MINIMIZE                             0xF020
#define SC_MAXIMIZE                             0xF030
#define SC_NEXTWINDOW                           0xF040
#define SC_PREVWINDOW                           0xF050

// Defines Used with WM_NCLBUTTONDOWN message
#define HTBOTTOMRIGHT          17

// Virtual Key Identifiers
#define VK_SHIFT                                0x10
#define VK_SPACE                                0x20
#define VK_F6                                   0x75
#define VK_TAB                                  0x09
#define VK_F4                                   0x73
#define VK_MINUS                                0xBD
#endif //__XPP__


//////////////////////////////////////////////////////////////////////
// Defines and Definitions used with std. COM Objects
//
// Note:
//   Contrary to normal practice, this section introduces mixed case
//   defines. This is done for compatility with ActiveX controls that
//   mixed casing.
//////////////////////////////////////////////////////////////////////

// Microsoft Common Controls
#ifdef __XPP__
// Control Appearance, see :Appearance
#define  ccFlat                                 0
#define  cc3D                                   1

// Defines controlling border styles, see :BorderStyle
#define  ccNone                                 0
#define  ccFixedSingle                          1

// Contants used with :OLEDropMode
#define  ccOLEDropNone                          0
#define  ccOLEDropManual                        1
#define  ccOLEDropAutomatic                     2
#endif //__XPP__


//////////////////////////////////////////////////////////////////////
// Mousepointer constants used with :MousePointer and :SetPointer()
//////////////////////////////////////////////////////////////////////
#ifdef __XPP__
#define  ccDefault                              0
#define  ccArrow                                1
#define  ccCross                                2
#define  ccIBeam                                3
#define  ccIcon                                 4
#define  ccSize                                 5
#define  ccSizeNESW                             6
#define  ccSizeNS                               7
#define  ccSizeNWSE                             8
#define  ccSizeEW                               9
#define  ccUpArrow                              10
#define  ccHourglass                            11
#define  ccNoDrop                               12
#define  ccArrowHourglass                       13
#define  ccArrowQuestion                        14
#define  ccSizeAll                              15
#define  ccCustom                               99
#endif //__XPP__


//////////////////////////////////////////////////////////////////////
// Miscellanuous Defines and Definitions
//////////////////////////////////////////////////////////////////////
#ifdef __XPP__
#define S_OK                                    0
#define S_FALSE                                 1

#define E_NOTIMPL                               0x80004001
#define E_NOINTERFACE                           0x80004002
#define E_FAIL                                  0x80004005
#define E_INVALIDARG                            0x80070057
#define E_OUTOFMEMORY                           0x8007000E
#define E_UNEXPECTED                            0x8000FFFF

#define RPC_E_CALL_REJECTED                     0x80010001
#define RPC_E_CANTPOST_INSENDCALL               0x80010003
#define RPC_E_CANTCALLOUT_INASYNCCALL           0x80010004
#define RPC_E_CONNECTION_TERMINATED             0x80010006
#define RPC_E_SERVER_DIED                       0x80010007
#define RPC_E_SERVER_DIED_DNE                   0x80010012
#define RPC_E_DISCONNECTED                      0x80010108
#define RPC_E_RETRY                             0x80010109
#define RPC_E_CANTCALLOUT_ININPUTSYNCCALL       0x8001010D
#define RPC_E_TIMEOUT                           0x8001011F

#define RPC_S_SERVER_UNAVAILABLE                0x800706BA
#endif


//////////////////////////////////////////////////////////////////////
// Invoke constants
//////////////////////////////////////////////////////////////////////
#ifdef __XPP__
#define DISPATCH_METHOD                         1
#define DISPATCH_PROPERTYGET                    2
#define DISPATCH_PROPERTYPUT                    4
#define DISPATCH_PROPERTYPUTREF                 8
#endif


//////////////////////////////////////////////////////////////////////
// Common Interface IDs
//////////////////////////////////////////////////////////////////////
#ifdef __XPP__
#define IID_IUnknown              "{00000000-0000-0000-C000-000000000046}"
#define IID_IDispatch             "{00020400-0000-0000-C000-000000000046}"
#define IID_IOleObject            "{00000112-0000-0000-C000-000000000046}"
#define IID_IOleWindow            "{00000114-0000-0000-C000-000000000046}"
#define IID_IFontDisp             "{BEF6E003-A874-101A-8BBA-00AA00300CAB}"
#define IID_ISpecifyPropertyPages "{B196B28B-BAB4-101A-B69C-00AA00341D07}"

#endif //__XPP__

//////////////////////////////////////////////////////////////////////
// Variant constants
//////////////////////////////////////////////////////////////////////
#ifdef __XPP__
//#ifdef __LIBRARY_LEVEL__
// basic types
#define VT_EMPTY                                0x00000000
#define VT_NULL                                 0x00000001
#define VT_I2                                   0x00000002
#define VT_I4                                   0x00000003
#define VT_R4                                   0x00000004
#define VT_R8                                   0x00000005
#define VT_CY                                   0x00000006
#define VT_DATE                                 0x00000007
#define VT_BSTR                                 0x00000008
#define VT_DISPATCH                             0x00000009
#define VT_ERROR                                0x0000000a
#define VT_BOOL                                 0x0000000b
#define VT_VARIANT                              0x0000000c
#define VT_UNKNOWN                              0x0000000d
#define VT_DECIMAL                              0x0000000e
#define VT_I1                                   0x00000010
#define VT_UI1                                  0x00000011
#define VT_UI2                                  0x00000012
#define VT_UI4                                  0x00000013
#define VT_I8                                   0x00000014
#define VT_UI8                                  0x00000015
#define VT_INT                                  0x00000016
#define VT_UINT                                 0x00000017
#define VT_VOID                                 0x00000018
#define VT_HRESULT                              0x00000019
#define VT_PTR                                  0x0000001a
#define VT_SAFEARRAY                            0x0000001b
#define VT_CARRAY                               0x0000001c
#define VT_USERDEFINED                          0x0000001d
#define VT_LPSTR                                0x0000001e
#define VT_LPWSTR                               0x0000001f
#define VT_RECORD                               0x00000024
#define VT_FILETIME                             0x00000040
#define VT_BLOB                                 0x00000041
#define VT_STREAM                               0x00000042
#define VT_STORAGE                              0x00000043
#define VT_STREAMED_OBJECT                      0x00000044
#define VT_STORED_OBJECT                        0x00000045
#define VT_BLOB_OBJECT                          0x00000046
#define VT_CF                                   0x00000047
#define VT_CLSID                                0x00000048
// complex types
#define VT_BSTR_BLOB                            0x00000fff
#define VT_VECTOR                               0x00001000
#define VT_ARRAY                                0x00002000
#define VT_BYREF                                0x00004000
#define VT_RESERVED                             0x00008000
#define VT_ILLEGAL                              0x0000ffff
#define VT_ILLEGALMASKED                        0x00000fff
#define VT_TYPEMASK                             0x00000fff
//#endif //__LIBRARY_LEVEL__
#endif //__XPP__



//////////////////////////////////////////////////////////////////////
//  Automation server creation
//////////////////////////////////////////////////////////////////////
#ifdef __XPP__
#define CLSCTX_INPROC_SERVER                    0x1
#define CLSCTX_INPROC_HANDLER                   0x2
#define CLSCTX_LOCAL_SERVER                     0x4
#define CLSCTX_INPROC_SERVER16                  0x8
#define CLSCTX_REMOTE_SERVER                    0x10
#define CLSCTX_INPROC_HANDLER16                 0x20
#define CLSCTX_NO_CODE_DOWNLOAD                 0x400
#define CLSCTX_NO_CUSTOM_MARSHAL                0x1000
#define CLSCTX_ENABLE_CODE_DOWNLOAD             0x2000
#define CLSCTX_NO_FAILURE_LOG                   0x4000
#define CLSCTX_DISABLE_AAA                      0x8000
#define CLSCTX_ENABLE_AAA                       0x10000
#define CLSCTX_FROM_DEFAULT_CONTEXT             0x20000

#define CLSCTX_SERVER              (CLSCTX_INPROC_SERVER + CLSCTX_LOCAL_SERVER)
#endif //__XPP__


//////////////////////////////////////////////////////////////////////
//  Error handling
//////////////////////////////////////////////////////////////////////
#ifdef __XPP__
#define AUTO_ERR_SUBSYS_NAME            "Automation"
#define AUTO_ERR_MISSING_PARAM_TEXT     "Missing parameter"
#define AUTO_ERR_NO_ACTIVEXCTRL_TEXT    "Component is no ActiveX control"
#define AUTO_ERR_CTRL_CREATE_TEXT       "Could not create ActiveX control"
#define AUTO_ERR_CONTAINER_CREATE_TEXT  "Could not create ActiveX control container"
#define AUTO_ERR_SERVER_BUSY_TEXT       "The server application [%s] is momentarily unable to"    + Chr(13) + Chr(10) +;
                                        "service the request. Please check whether [%s] does not respond"      + Chr(13) + Chr(10) +;
                                        "because it is currently waiting for user interaction. If the problem persists,"   + Chr(13) + Chr(10) + ;
                                        "try restarting the application before retrying the operation."
#define AUTO_ERR_SERVER_STATE_TEXT      "The server application [%s] does not respond or is unavailable."  + Chr(13) + Chr(10) +;
                                        "Please check whether an error occured in [%s] that might provide further" + Chr(13) + Chr(10) +;
"info on what caused the problem."
#define AUTO_ERR_NUM_RETRIES                    3
#define AUTO_ERR_RETRY_TIMEOUT                  100

#define AUTO_ERR_SUBCODE                        6500
#define AUTO_ERR_MISSING_PARAM                  6501
#define AUTO_ERR_NO_ACTIVEXCTRL                 6502
#define AUTO_ERR_CTRL_CREATE                    6503
#define AUTO_ERR_CONTAINER_CREATE               6504
#define AUTO_ERR_SERVER_BUSY                    6505
#define AUTO_ERR_SERVER_STATE                   6506
#define AUTO_ERR_LASTCODE                       6507
#endif //__XPP__


#define __ACTIVEX_CH__
#endif // __ACTIVEX_CH__
// EOF
