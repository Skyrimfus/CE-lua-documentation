#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <String.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 1200,600)
$Edit1 = GUICtrlCreateEdit("in", 0, 0, 600, 500)
$out = GUICtrlCreateEdit("out", 600, 0, 600, 500)
$Button1 = GUICtrlCreateButton("Button1", 300, 500, 97, 65)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Global $keywords = ["and", "break", "do", "else", "elseif", "end", "false", "for", "function", "if", "in", "local", "nil", "not", "or", "repeat", "return", "then", "true", "until", "while"]
Global $wordTerminator = ["+", "-", "*", "/", "^", ",", ";", "(", ">", "<", "=", "~", ")","%"]
Global $builtinFuncs = ["print","unpack","createTimer","OpenProcess","printf", _
'getCodeFilter','getWriteLog','getUltimap2','addresslist_getCount','addresslist_getMemoryRecord','addresslist_getMemoryRecordByDescription','addresslist_getMemoryRecordByID','addresslist_createMemoryRecord','addresslist_getSelectedRecords','addresslist_doDescriptionChange','addresslist_doAddressChange','addresslist_doTypeChange','addresslist_doValueChange','addresslist_getSelectedRecord','addresslist_setSelectedRecord','bOr','bXor','bAnd','bShl','bShr','bNot','pen_getColor','pen_setColor','pen_getWidth','pen_setWidth','brush_getColor','brush_setColor','createButton','button_getModalResult','button_setModalResult','wordToByteTable','dwordToByteTable','qwordToByteTable','floatToByteTable','doubleToByteTable','extendedToByteTable','stringToByteTable','wideStringToByteTable','byteTableToWord','byteTableToDword','byteTableToQword','byteTableToFloat','byteTableToDouble','byteTableToExtended','byteTableToString','byteTableToWideString','createCalendar','calendarDiffDays','calendarDateToNumber','calendarNumberToDate','canvas_getBrush','canvas_getPen','canvas_getFont','canvas_getWidth','canvas_getHeight','canvas_line','canvas_lineTo','canvas_rect','canvas_fillRect','canvas_textOut','canvas_getTextWidth','canvas_getTextHeight','canvas_getPixel','canvas_setPixel','canvas_floodFill','canvas_ellipse','canvas_gradientFill','canvas_copyRect','canvas_draw','canvas_getPenPosition','canvas_setPenPosition','createCECustomButton','cheatcomponent_setActive','cheatcomponent_getActive','cheatcomponent_setDescription','cheatcomponent_getDescription','cheatcomponent_setHotkey','cheatcomponent_getHotkey','cheatcomponent_setDescriptionLeft','cheatcomponent_getDescriptionLeft','cheatcomponent_setHotkeyLeft','cheatcomponent_getHotkeyLeft','cheatcomponent_setEditValue','cheatcomponent_getEditValue','createCheckBox','checkbox_getAllowGrayed','checkbox_setAllowGrayed','checkbox_getState','checkbox_setState','checkbox_onChange','createCheckListBox','collection_clear','collection_getCount','collection_delete','createComboBox','combobox_clear','combobox_getItems','combobox_getItemIndex','combobox_setItemIndex','combobox_getCanvas','component_getComponentCount','component_getComponent','component_findComponentByName','component_getName','component_setName','component_getTag','component_setTag','component_getOwner','control_setCaption','control_getCaption','control_setPosition','control_getPosition','control_setSize','control_getSize','control_setAlign','control_getAlign','control_onClick','control_doClick','control_setEnabled','control_getEnabled','control_setVisible','control_getVisible','control_setColor','control_getColor','control_setParent','control_getParent','control_setPopupMenu','control_getPopupMenu','control_getFont','customControl_getCanvas','customcontrol_getCanvas','createImageList','getCustomType','registerCustomTypeLua','registerCustomTypeAutoAssembler','createD3DHook','debug_setLastBranchRecording','debug_getMaxLastBranchRecord','debug_getLastBranchRecord','debug_getXMMPointer','createDiagram','createDisassembler','createCR3Disassembler','getDefaultDisassembler','getVisibleDisassembler','getDissectCode','getDotNetDataCollector','createEdit','edit_clear','edit_getSelStart','edit_getSelLength','edit_getSelText','edit_select','edit_selectAll','edit_selectText','edit_clearSelection','edit_copyToClipboard','edit_cutToClipboard','edit_pasteFromClipboard','edit_onChange','edit_getOnChange','edit_setOnChange','edit_onKeyPress','edit_getOnKeyPress','edit_setOnKeyPress','edit_onKeyUp','edit_getOnKeyUp','edit_setOnKeyUp','edit_onKeyDown','edit_getOnKeyDown','edit_setOnKeyDown','createFindDialog','createFont','font_getSize','font_setSize','font_getName','font_setName','font_getColor','font_setColor','createForm','createFormFromFile','createFormFromStream','form_centerScreen','form_onClose','form_show','form_hide','form_close','form_showModal','form_isForegroundWindow','form_getMenu','form_setMenu','form_saveToFile','form_setDoNotSaveInTable','form_getDoNotSaveInTable','form_printToRasterImage','form_dragNow','createFoundList', _
'foundlist_initialize','foundlist_deinitialize','foundlist_getCount','foundlist_getAddress','foundlist_getValue','createHotkey','generichotkey_setKeys','generichotkey_getKeys','generichotkey_onHotkey','graphic_getWidth','graphic_setWidth','graphic_getHeight','graphic_setHeight','graphicControl_getCanvas','graphiccontrol_getCanvas','createGroupBox','print','sleep','cheatEngineIs64Bit','targetIs64Bit','readBytes','writeBytes','readByte','readShortInteger','readSmallInteger','readInteger','readQword','readPointer','readFloat','readDouble','readString','readByteLocal','readShortIntegerLocal','readSmallIntegerLocal','readIntegerLocal','readQwordLocal','readPointerLocal','readFloatLocal','readDoubleLocal','readStringLocal','writeShortInteger','writeByte','writeSmallInteger','writeInteger','writeQword','writePointer','writeFloat','writeDouble','writeString','writeByteLocal','writeShortIntegerLocal','writeSmallIntegerLocal','writeIntegerLocal','writeQwordLocal','writePointerLocal','writeFloatLocal','writeDoubleLocal','writeStringLocal','readBytesLocal','writeBytesLocal','getAddress','getAddressSafe','getCurrentThreadID','inMainThread','synchronize','queue','pause','unpause','autoAssemble','autoAssembleCheck','assemble','deAlloc','deAllocLocal','showMessage','inputQuery','getPixel','getMousePos','setMousePos','createTableEntry','getTableEntry','mouse_event','isKeyPressed','keyDown','keyUp','doKeyPress','getProcessIDFromProcessName','openProcess','debugProcess','debug_getBreakpointList','debug_isDebugging','debug_getCurrentDebuggerInterface','debug_canBreak','debug_breakThread','debug_isBroken','debug_setBreakpoint','debug_setBreakpointForThread','debug_removeBreakpoint','debug_continueFromBreakpoint','debug_addThreadToNoBreakList','debug_removeThreadFromNoBreakList','debug_getContext','debug_setContext','debug_updateGUI','getDebugContext','setDebugContext','closeCE','hideAllCEWindows','unhideMainCEwindow','createLabel','createSplitter','createPaintBox','messageDialog','speedhack_setSpeed','speedhack_getSpeed','injectDLL','injectLibrary','getAutoAttachList','generateAPIHookScript','createProcess','AOBScan','AOBScanUnique','AOBScanModuleUnique','getOpenedProcessID','getOpenedProcessHandle','getModuleSize','waitForSections','waitForExports','waitForDotNet','waitForPDB','waitforExports','waitforDotNet','waitforPDB','searchPDBWhileLoading','reinitializeSymbolhandler','reinitializeDotNetSymbolhandler','reinitializeSelfSymbolhandler','enumModules','getNameFromAddress','inModule','inSystemModule','getCommonModuleList','createToggleBox','openDialog_execute','createOpenDialog','createSaveDialog','createSelectDirectoryDialog','createMemoryStream','createFileStream','createStringStream','getSettingsForm','getMemoryViewForm','getMainForm','getAddressList','getFreezeTimer','getUpdateTimer','setGlobalKeyPollInterval','setGlobalDelayBetweenHotkeyActivation','writeRegionToFile','readRegionFromFile','registerSymbol','unregisterSymbol','getSymbolInfo','resetLuaState','reloadSettingsFromRegistry','createMemScan','getCurrentMemscan','supportCheatEngine','fuckCheatEngine','inheritsFromObject','inheritsFromComponent','inheritsFromControl','inheritsFromWinControl','beep','dbk_initialize','dbk_useKernelmodeOpenProcess','dbk_useKernelmodeProcessMemoryAccess','dbk_useKernelmodeQueryMemoryRegions','dbk_usePhysicalMemoryAccess','dbk_setSaferPhysicalMemoryScanning','dbk_readPhysicalMemory','dbk_writePhysicalMemory','dbk_getPEProcess','dbk_getPEThread','dbk_executeKernelMemory','dbk_readMSR','dbk_writeMSR','dbk_getCR0','dbk_getCR3','dbk_getCR4','dbk_test','dbvm_getCR0','dbvm_getCR3','dbvm_getCR4','dbvm_readMSR','dbvm_writeMSR','dbvm_jtagbp','dbvm_readPhysicalMemory','dbvm_writePhysicalMemory','dbvm_psod','getCodeFilter','getWriteLog','getUltimap2','addresslist_getCount','addresslist_getMemoryRecord','addresslist_getMemoryRecordByDescription','addresslist_getMemoryRecordByID','addresslist_createMemoryRecord','addresslist_getSelectedRecords','addresslist_doDescriptionChange','addresslist_doAddressChange','addresslist_doTypeChange', _
'addresslist_doValueChange','addresslist_getSelectedRecord','addresslist_setSelectedRecord','bOr','bXor','bAnd','bShl','bShr','bNot','pen_getColor','pen_setColor','pen_getWidth','getCodeFilter','getWriteLog','getUltimap2','addresslist_getCount','addresslist_getMemoryRecord','addresslist_getMemoryRecordByDescription','addresslist_getMemoryRecordByID','addresslist_createMemoryRecord','addresslist_getSelectedRecords','addresslist_doDescriptionChange','addresslist_doAddressChange','addresslist_doTypeChange','addresslist_doValueChange','addresslist_getSelectedRecord','addresslist_setSelectedRecord','bOr','bXor','bAnd','bShl','bShr','bNot','pen_getColor','pen_setColor','pen_getWidth','pen_setWidth','brush_getColor','brush_setColor','createButton','button_getModalResult','button_setModalResult','wordToByteTable','dwordToByteTable','qwordToByteTable','floatToByteTable','doubleToByteTable','extendedToByteTable','stringToByteTable','wideStringToByteTable','byteTableToWord','byteTableToDword','byteTableToQword','byteTableToFloat','byteTableToDouble','byteTableToExtended','byteTableToString','byteTableToWideString','createCalendar','calendarDiffDays','calendarDateToNumber','calendarNumberToDate','canvas_getBrush','canvas_getPen','canvas_getFont','canvas_getWidth','canvas_getHeight','canvas_line','canvas_lineTo','canvas_rect','canvas_fillRect','canvas_textOut','canvas_getTextWidth','canvas_getTextHeight','canvas_getPixel','canvas_setPixel','canvas_floodFill','canvas_ellipse','canvas_gradientFill','canvas_copyRect','canvas_draw','canvas_getPenPosition','canvas_setPenPosition','createCECustomButton','cheatcomponent_setActive','cheatcomponent_getActive','cheatcomponent_setDescription','cheatcomponent_getDescription','cheatcomponent_setHotkey','cheatcomponent_getHotkey','cheatcomponent_setDescriptionLeft','cheatcomponent_getDescriptionLeft','cheatcomponent_setHotkeyLeft','cheatcomponent_getHotkeyLeft','cheatcomponent_setEditValue','cheatcomponent_getEditValue','createCheckBox','checkbox_getAllowGrayed','checkbox_setAllowGrayed','checkbox_getState','checkbox_setState','checkbox_onChange','createCheckListBox','collection_clear','collection_getCount','collection_delete','createComboBox','combobox_clear','combobox_getItems','combobox_getItemIndex','combobox_setItemIndex','combobox_getCanvas','component_getComponentCount','component_getComponent','component_findComponentByName','component_getName','component_setName','component_getTag','component_setTag','component_getOwner','control_setCaption','control_getCaption','control_setPosition','control_getPosition','control_setSize','control_getSize','control_setAlign','control_getAlign','control_onClick','control_doClick','control_setEnabled','control_getEnabled','control_setVisible','control_getVisible','control_setColor','control_getColor','control_setParent','control_getParent','control_setPopupMenu','control_getPopupMenu','control_getFont','customControl_getCanvas','customcontrol_getCanvas','createImageList','getCustomType','registerCustomTypeLua','registerCustomTypeAutoAssembler','createD3DHook','debug_setLastBranchRecording','debug_getMaxLastBranchRecord','debug_getLastBranchRecord','debug_getXMMPointer','createDiagram','createDisassembler','createCR3Disassembler','getDefaultDisassembler','getVisibleDisassembler','getDissectCode','getDotNetDataCollector','createEdit','edit_clear','edit_getSelStart','edit_getSelLength','edit_getSelText','edit_select','edit_selectAll','edit_selectText','edit_clearSelection','edit_copyToClipboard','edit_cutToClipboard','edit_pasteFromClipboard','edit_onChange','edit_getOnChange','edit_setOnChange','edit_onKeyPress','edit_getOnKeyPress','edit_setOnKeyPress','edit_onKeyUp','edit_getOnKeyUp','edit_setOnKeyUp','edit_onKeyDown','edit_getOnKeyDown','edit_setOnKeyDown','createFindDialog','createFont','font_getSize','font_setSize','font_getName','font_setName','font_getColor','font_setColor','createForm','createFormFromFile','createFormFromStream','form_centerScreen','form_onClose','form_show','form_hide','form_close','form_showModal', _
'form_isForegroundWindow','form_getMenu','form_setMenu','form_saveToFile','form_setDoNotSaveInTable','form_getDoNotSaveInTable','form_printToRasterImage','form_dragNow','createFoundList','foundlist_initialize','foundlist_deinitialize','foundlist_getCount','foundlist_getAddress','foundlist_getValue','createHotkey','generichotkey_setKeys','generichotkey_getKeys','generichotkey_onHotkey','graphic_getWidth','graphic_setWidth','graphic_getHeight','graphic_setHeight','graphicControl_getCanvas','graphiccontrol_getCanvas','createGroupBox','print','sleep','cheatEngineIs64Bit','targetIs64Bit','readBytes','writeBytes','readByte','readShortInteger','readSmallInteger','readInteger','readQword','readPointer','readFloat','readDouble','readString','readByteLocal','readShortIntegerLocal','readSmallIntegerLocal','readIntegerLocal','readQwordLocal','readPointerLocal','readFloatLocal','readDoubleLocal','readStringLocal','writeShortInteger','writeByte','writeSmallInteger','writeInteger','writeQword','writePointer','writeFloat','writeDouble','writeString','writeByteLocal','writeShortIntegerLocal','writeSmallIntegerLocal','writeIntegerLocal','writeQwordLocal','writePointerLocal','writeFloatLocal','writeDoubleLocal','writeStringLocal','readBytesLocal','writeBytesLocal','getAddress','getAddressSafe','getCurrentThreadID','inMainThread','synchronize','queue','pause','unpause','autoAssemble','autoAssembleCheck','assemble','deAlloc','deAllocLocal','showMessage','inputQuery','getPixel','getMousePos','setMousePos','createTableEntry','getTableEntry','mouse_event','isKeyPressed','keyDown','keyUp','doKeyPress','getProcessIDFromProcessName','openProcess','debugProcess','debug_getBreakpointList','debug_isDebugging','debug_getCurrentDebuggerInterface','debug_canBreak','debug_breakThread','debug_isBroken','debug_setBreakpoint','debug_setBreakpointForThread','debug_removeBreakpoint','debug_continueFromBreakpoint','debug_addThreadToNoBreakList','debug_removeThreadFromNoBreakList','debug_getContext','debug_setContext','debug_updateGUI','getDebugContext','setDebugContext','closeCE','hideAllCEWindows','unhideMainCEwindow','createLabel','createSplitter','createPaintBox','messageDialog','speedhack_setSpeed','speedhack_getSpeed','injectDLL','injectLibrary','getAutoAttachList','generateAPIHookScript','createProcess','AOBScan','AOBScanUnique','AOBScanModuleUnique','getOpenedProcessID','getOpenedProcessHandle','getModuleSize','waitForSections','waitForExports','waitForDotNet','waitForPDB','waitforExports','waitforDotNet','waitforPDB','searchPDBWhileLoading','reinitializeSymbolhandler','reinitializeDotNetSymbolhandler','reinitializeSelfSymbolhandler','enumModules','getNameFromAddress','inModule','inSystemModule','getCommonModuleList','createToggleBox','openDialog_execute','createOpenDialog','createSaveDialog','createSelectDirectoryDialog','createMemoryStream','createFileStream','createStringStream','getSettingsForm','getMemoryViewForm','getMainForm','getAddressList','getFreezeTimer','getUpdateTimer','setGlobalKeyPollInterval','setGlobalDelayBetweenHotkeyActivation','writeRegionToFile','readRegionFromFile','registerSymbol','unregisterSymbol','getSymbolInfo','resetLuaState','reloadSettingsFromRegistry','createMemScan','getCurrentMemscan','supportCheatEngine','fuckCheatEngine','inheritsFromObject','inheritsFromComponent','inheritsFromControl','inheritsFromWinControl','beep','dbk_initialize','dbk_useKernelmodeOpenProcess','dbk_useKernelmodeProcessMemoryAccess','dbk_useKernelmodeQueryMemoryRegions','dbk_usePhysicalMemoryAccess','dbk_setSaferPhysicalMemoryScanning','dbk_readPhysicalMemory','dbk_writePhysicalMemory','dbk_getPEProcess','dbk_getPEThread','dbk_executeKernelMemory','dbk_readMSR','dbk_writeMSR','dbk_getCR0','dbk_getCR3','dbk_getCR4','dbk_test','dbvm_getCR0','dbvm_getCR3','dbvm_getCR4','dbvm_readMSR','dbvm_writeMSR','dbvm_jtagbp','dbvm_readPhysicalMemory','dbvm_writePhysicalMemory','dbvm_psod','dbvm_getNMIcount','dbvm_get_statistics','dbvm_debug_setSpinlockTimeout','dbvm_watch_writes','dbvm_watch_reads','dbvm_watch_executes', _
'dbvm_watch_retrievelog','dbvm_watch_disable','dbvm_watch_getstatus','dbvm_cloak_activate','dbvm_cloak_deactivate','dbvm_cloak_readOriginal','dbvm_cloak_writeOriginal','dbvm_changeregonbp','dbvm_removechangeregonbp','dbvm_traceonbp','dbvm_traceonbp_getstatus','dbvm_traceonbp_stoptrace','dbvm_traceonbp_remove','dbvm_traceonbp_retrievelog','dbvm_bp_getBrokenThreadListSize','dbvm_bp_getBrokenThreadEventShort','dbvm_bp_getBrokenThreadEventFull','dbvm_bp_setBrokenThreadEventFull','dbvm_bp_resumeBrokenThread','dbvm_bp_getProcessAndThreadIDFromEvent','dbvm_ept_reset','dbvm_log_cr3_start','dbvm_log_cr3_stop','dbvm_registerPlugin','dbvm_raisePMI','dbvm_ultimap2_hideRangeUsage','dbvm_ultimap_getDebugInfo','dbvm_setTSCAdjust','dbvm_speedhack_setSpeed','dbvm_enableTSCHook','dbvm_disableTSCHook','dbvm_findCR3','dbvm_hidephysicalmemory','dbvm_hidephysicalmemoryall','getPageInfoCR3','getNextReadablePageCR3','dbk_getPhysicalAddress','dbk_writesIgnoreWriteProtection','getPhysicalAddressCR3','readProcessMemoryCR3','writeProcessMemoryCR3','allocateSharedMemoryLocal','deallocateSharedMemoryLocal','allocateSharedMemory','deallocateSharedMemory','getCheatEngineDir','getCheatEngineProcessID','disassemble','splitDisassembledString','getInstructionSize','getPreviousOpcode','disassemblerview_getSelectedAddress','disassemblerview_setSelectedAddress','disassemblerview_onSelectionChange','hexadecimalview_getTopAddress','hexadecimalview_setTopAddress','hexadecimalview_onAddressChange','hexadecimalview_onByteSelect','getForegroundProcess','getFormCount','getForm','registerFormAddNotification','unregisterFormAddNotification','onAutoGuess','onAPIPointerChange','setAPIPointer','dbvm_initialize','dbvm_setKeys','dbvm_getMemory','dbvm_addMemory','shellExecute','runCommand','getTickCount','rdtsc','processMessages','integerToUserData','userDataToInteger','writeToClipboard','readFromClipboard','createBitmap','createPNG','createJpeg','createIcon','errorOnLookupFailure','waitforsymbols','loadPlugin','getCEVersion','utf8ToAnsi','UTF8ToAnsi','ansiToUtf8','ansiToUTF8','fullAccess','getWindowlist','getWindowList','getProcesslist','getProcessList','getThreadlist','getThreadList','loadTable','saveTable','signTable','detachIfPossible','getComment','setComment','getHeader','setHeader','createClass','createComponentClass','openLuaServer','registerAutoAssemblerCommand','unregisterAutoAssemblerCommand','registerSymbolLookupCallback','unregisterSymbolLookupCallback','registerAddressLookupCallback','unregisterAddressLookupCallback','registerGlobalDisassembleOverride','unregisterGlobalDisassembleOverride','registerStructureDissectOverride','unregisterStructureDissectOverride','registerStructureNameLookup','unregisterStructureNameLookup','registerAssembler','unregisterAssembler','registerAutoAssemblerPrologue','unregisterAutoAssemblerPrologue','registerStructureAndElementListCallback','unregisterStructureAndElementListCallback','shortCutToText','textToShortCut','checkSynchronize','playSound','outputDebugString','broadcastEnvironmentUpdate','getUserRegistryEnvironmentVariable','setUserRegistryEnvironmentVariable','createRef','getRef','destroyRef','activateProtection','getLuaEngine','createLuaEngine','getApplication','stringToMD5String','convertKeyComboToString','restoreSeDebugPrivilege','translate','translateID','loadPOFile','getTranslationFolder','registerBinUtil','setPointerSize','executeCode','executeCodeEx','executeMethod','createExecuteMethodStub','createExecuteCodeExStub','executeCodeLocal','executeCodeLocalEx','md5file','md5memory','allocateKernelMemory','freeKernelMemory','mapMemory','unmapMemory','lockMemory','unlockMemory','sendMessage','sendMessageTimeout','findWindow','getWindow','getWindowProcessID','getWindowCaption','getWindowClassName','getForegroundWindow','getXBox360ControllerKeyPress','getXBox360ControllerState','setXBox360ControllerVibration','registerAutoAssemblerTemplate','unregisterAutoAssemblerTemplate','getUniqueAOB','generateCodeInjectionScript','generateAOBInjectionScript','generateFullInjectionScript', _
'loadFontFromStream','unloadLoadedFont','speak','speakEnglish','getFileVersion','getCheatEngineFileVersion','hookWndProc','unhookWndProc','registerEXETrainerFeature','unregisterEXETrainerFeature','encodeFunction','decodeFunction','encodeFunctionEx','getFileList','getDirectoryList','connectToCEServer','copyMemory','enableDRM','openFileAsProcess','saveOpenedFile','getPEB','createAPC','setAssemblerMode','allocateMemory','try','createSection','mapViewOfSection','unMapViewOfSection','getSystemMetrics','getScreenHeight','getScreenWidth','getScreenDPI','getWorkAreaHeight','getWorkAreaWidth','getScreenCanvas','getHandleList','closeRemoteHandle','showSelectionList','cpuid','gc_setPassive','gc_setActivate','gc_setActive','getHotkeyHandlerThread','enumMemoryRegions','enumMemoryRegionsCR3','setForceCR3VirtualQueryEx','enableWindowsSymbols','enableKernelSymbols','compareMemory','enumExports','duplicateHandle','getOperatingSystem','createColorDialog','createColorBox','createAutoAssemblerForm','getRTTIClassName','getAutoRunPath','getAutorunPath','extractFileName','extractFileExt','extractFileNameWithoutExt','extractFilePath','registerLuaFunctionHighlight','unregisterLuaFunctionHighlight','setProgressState','setProgressValue','compile','compileFiles','compileTCCLib','addCIncludePath','removeCIncludePath','dotNetExecuteClassMethod','compileCS','compileCSharp','compilecsharp','signExtend','darkMode','getCEName','createImage','image_loadImageFromFile','image_transparent','image_stretch','image_getCanvas','image_getPicture','getInternet','createListBox','listbox_clear','listbox_getItems','listbox_getItemIndex','listbox_setItemIndex','listbox_getCanvas','listcolumn_setAutosize','listcolumn_getCaption','listcolumn_setCaption','listcolumn_getMaxWidth','listcolumn_setMaxWidth','listcolumn_getMinWidth','listcolumn_setMinWidth','listcolumn_getWidth','listcolumn_setWidth','listcolumns_add','listcolumns_getColumn','listitem_delete','listitem_getCaption','listitem_setCaption','listitem_getChecked','listitem_setChecked','listitem_getSubItems','listitems_clear','listitems_getCount','listitems_getItem','listitems_add','createListView','createListview','listview_clear','listview_getColumns','listview_getItems','listview_getItemIndex','listview_setItemIndex','listview_getCanvas','loadModule','createMemo','memo_append','memo_getLines','memo_getWordWrap','memo_setWordWrap','memo_getWantTabs','memo_setWantTabs','memo_getWantReturns','memo_setWantReturns','memo_getScrollbars','memo_setScrollbars','memoryrecord_setDescription','memoryrecord_getDescription','memoryrecord_getAddress','memoryrecord_setAddress','memoryrecord_getType','memoryrecord_setType','memoryrecord_getValue','memoryrecord_setValue','memoryrecord_getScript','memoryrecord_setScript','memoryrecord_isActive','memoryrecord_isSelected','memoryrecord_freeze','memoryrecord_unfreeze','memoryrecord_setColor','memoryrecord_appendToEntry','memoryrecord_delete','memoryrecord_string_getSize','memoryrecord_string_setSize','memoryrecord_string_getUnicode','memoryrecord_string_setUnicode','memoryrecord_binary_getStartbit','memoryrecord_binary_setStartbit','memoryrecord_binary_getSize','memoryrecord_binary_setSize','memoryrecord_aob_getSize','memoryrecord_aob_setSize','memoryrecord_getID','memoryrecord_getHotkeyCount','memoryrecord_getHotkey','memoryrecord_getHotkeyByID','memoryrecord_onActivate','memoryrecord_onDeactivate','memoryrecord_onDestroy','memoryrecordhotkey_getDescription','memoryrecordhotkey_getHotkeyString','memoryrecordhotkey_getID','memoryrecordhotkey_onHotkey','memoryrecordhotkey_onPostHotkey','memoryrecordhotkey_getOwner','memoryrecordhotkey_doHotkey','createMemoryView','memoryview_getDisassemblerView','memoryview_getHexadecimalView','memscan_firstScan','memscan_nextScan','memscan_waitTillDone','memscan_saveCurrentResults','memscan_getAttachedFoundlist','memscan_returnOnlyOneResult','memscan_getOnlyResult','menu_getItems','createMainMenu','createPopupMenu','createMenuItem','menuItem_getCaption','menuItem_setCaption','menuItem_getShortcut', _
'menuItem_setShortcut','menuItem_getCount','menuItem_getItem','menuItem_add','menuItem_insert','menuItem_delete','menuItem_onClick','menuItem_doClick','getPropertyList','setProperty','getProperty','setMethodProperty','getMethodProperty','object_getClassName','object_destroy','d3dhook_initializeHook','d3dhook_onClick','d3dhook_onKey','d3dhook_beginUpdate','d3dhook_endUpdate','d3dhook_getWidth','d3dhook_getHeight','d3dhook_setDisabledZBuffer','d3dhook_setWireframeMode','d3dhook_setMouseClip','d3dhook_enableConsole','d3dhook_createTexture','d3dhook_texture_getHeight','d3dhook_texture_getWidth','d3dhook_texture_loadTextureByPicture','d3dhook_createFontmap','d3dhook_fontmap_changeFont','d3dhook_fontmap_getTextWidth','d3dhook_renderobject_getX','d3dhook_renderobject_setX','d3dhook_renderobject_getY','d3dhook_renderobject_setY','d3dhook_renderobject_getAlphablend','d3dhook_renderobject_setAlphablend','d3dhook_renderobject_getVisible','d3dhook_renderobject_setVisible','d3dhook_renderobject_getZOrder','d3dhook_renderobject_setZOrder','d3dhook_createSprite','d3dhook_sprite_getWidth','d3dhook_sprite_setWidth','d3dhook_sprite_getHeight','d3dhook_sprite_setHeight','d3dhook_sprite_getTexture','d3dhook_sprite_setTexture','d3dhook_createTextContainer','d3dhook_textcontainer_getFontMap','d3dhook_textcontainer_setFontMap','d3dhook_textcontainer_getText','d3dhook_textcontainer_setText','createPageControl','createPanel','panel_getAlignment','panel_setAlignment','panel_getBevelInner','panel_setBevelInner','panel_getBevelOuter','panel_setBevelOuter','panel_getBevelWidth','panel_setBevelWidth','panel_getFullRepaint','panel_setFullRepaint','pen_getColor','pen_setColor','pen_getWidth','pen_setWidth','createPicture','picture_loadFromFile','picture_loadFromStream','picture_assign','picture_getGraphic','picture_getPNG','picture_getBitmap','picture_getJpeg','connectToPipe','createPipe','createProgressBar','progressbar_stepIt','progressbar_stepBy','progressbar_getMax','progressbar_setMax','progressbar_getMin','progressbar_setMin','progressbar_getPosition','progressbar_setPosition','createRadioGroup','radiogroup_getRows','radiogroup_getItems','radiogroup_getColumns','radiogroup_setColumns','radiogroup_getItemIndex','radiogroup_setItemIndex','radiogroup_onClick','rasterimage_getCanvas','rasterimage_getPixelFormat','rasterimage_setPixelFormat','rasterimage_getTransparent','rasterimage_setTransparent','rasterimage_getTransparentColor','rasterimage_setTransparentColor','createRegion','region_addRectangle','region_addPolygon','createStubExecutor','createRemoteExecutor','createRemoteThread','createRipRelativeScanner','getSettings','createSQLite3Connection','createODBCConnection','createSQLTransaction','createSQLQuery','setSQLiteLibraryName','createStringlist','createStringList','stringlist_getDuplicates','stringlist_setDuplicates','stringlist_getSorted','stringlist_setSorted','stringlist_getCaseSensitive','stringlist_setCaseSensitive','strings_add','strings_clear','strings_delete','strings_getText','strings_setText','strings_indexOf','strings_insert','strings_getCount','strings_remove','strings_getString','strings_setString','strings_loadFromFile','strings_saveToFile','getStructureCount','getStructure','createStructure','createStructureFromName','structure_getName','structure_setName','structure_getSize','structure_getElementCount','structure_getElement','structure_getElementByOffset','structure_addElement','structure_autoGuess','structure_beginUpdate','structure_endUpdate','structure_addToGlobalStructureList','structure_removeFromGlobalStructureList','structureElement_getOwnerStructure','structureElement_getOffset','structureElement_setOffset','structureElement_getName','structureElement_setName','structureElement_getVartype','structureElement_setVartype','structureElement_getChildStruct','structureElement_setChildStruct','structureElement_getChildStructStart','structureElement_setChildStructStart','structureElement_getBytesize','structureElement_setBytesize','createStructureForm','enumStructureForms', _
'createSymbolList','getMainSymbolList','createSynEdit','createTableFile','findTableFile','tablefile_delete','tablefile_saveToFile','tablefile_getData','createNativeThread','createNativeThreadNewState','createNativeThreadSuspended','createThread','createThreadNewState','createThreadSuspended','getCPUCount','thread_freeOnTerminate','thread_synchronize','thread_waitfor','createCriticalSection','createEvent','createSemaphore','createMultiReadExclusiveWriteSynchronizer','createTimerInternal','timer_setInterval','timer_onTimer','timer_setEnabled','timer_getEnabled','createTrackBar','trackbar_getMax','trackbar_setMax','trackbar_getMin','trackbar_setMin','trackbar_getPosition','trackbar_setPosition','trackbar_onChange','createTreeView','createTreeview','wincontrol_getControlCount','wincontrol_getControl','wincontrol_getControlAtPos','wincontrol_onEnter','wincontrol_onExit','wincontrol_canFocus','wincontrol_focused','wincontrol_setFocus','wincontrol_setShape','xmplayer_playXM','xmplayer_pause','xmplayer_resume','xmplayer_stop','xmplayer_isPlaying','createReversePointerListHandlerFromFile','forceModule']


;~ Global $oDictionary = ObjCreate("Scripting.Dictionary")
;~ ;$oDictionary.Add ("One",    "Same"  )


Global $skips[0]
Global $strings[0]
Global $comments[0]
Global $output = ""
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			$output = ""
			ReDim $strings[0]
			ReDim $comments[0]
			$arr = StringSplit(GUICtrlRead($Edit1), "")

			$stringStarted = False
			$multiStringEq = 0
			$commentStarted = False
			For $i = 1 To $arr[0]
				Local $char = $arr[$i]

				If $stringStarted == False And $char == "-" And $arr[$i + 1] == "-" Then



					Local $sz = UBound($comments)
					ReDim $comments[$sz + 2]
					$comments[$sz] = $i

					If $arr[$i + 2] == "[" Then;if comment starts with --[
						$multiComEq = 0
						$j = 0
						While True
							$j += 1
							If $arr[$i + 2 + $j] == "[" Then;check how many chracters betwen [ and [ ( --[==[ )
								$i += $j
								ExitLoop
							EndIf
							$multiComEq += 1
						WEnd
						$j = 0
						While True;try to find the end of the multi-lined comment
							$j += 1
							If $arr[$i + $j] == "]" Then
								$comments[$sz + 1] = $i + $j +2+ $multiComEq
								$i = $comments[$sz + 1]
								ExitLoop
							EndIf
						WEnd
						;MsgBox(0,"multicomment =",$i)
						ContinueLoop
					Else
						$j = 0
						While True
							$j += 1
							If $arr[$i + $j] == @CR And $arr[$i + $j + 1] == @LF Then
								;MsgBox(0,"COMMENT END AT",$i+$j)
								$comments[$sz + 1] = $i + $j
								$i = $i + $j + 1
								ExitLoop
							EndIf
							If $i + $j == $arr[0] Then
								;MsgBox(0,$i+$j,"EOL")
								$comments[$sz + 1] = $i + $j + 1
								ExitLoop (2) ;END OF LINE HERE; TERMINATE
							EndIf
						WEnd
						ContinueLoop
					EndIf
				EndIf

				If $char == '"' And $commentStarted == False Then
					If $stringStarted == False Then
						$stringStarted = '"'
						Local $sz = UBound($strings)
						ReDim $strings[$sz + 1]
						$strings[$sz] = $i
					ElseIf $stringStarted == '"' Then
						$stringStarted = False
						Local $sz = UBound($strings)
						ReDim $strings[$sz + 1]
						$strings[$sz] = $i

					EndIf
				EndIf
				If $char == "[" And $commentStarted == False Then
					If $stringStarted == False Then
						$j = 1
						$multiStringEq = 0
						While True
							If $arr[$i + $j] == "]" Then
								$stringStarted = False
								$i+=$j
								ExitLoop
							EndIf
							If $arr[$i + $j] == "[" Then
								$i += $j - 1
								$stringStarted = True
								ExitLoop
							EndIf
							$multiStringEq = $j
							$j += 1
						WEnd
						If $stringStarted == True Then
							$stringStarted = "["
							Local $sz = UBound($strings)
							ReDim $strings[$sz + 1]
							$strings[$sz] = $i - $multiStringEq
							;MsgBox(0,"Started multilinestr with this many =",$multiStringEq)
						EndIf
					EndIf

				EndIf
				If $char == "]" And $stringStarted == "[" Then
					$j = 1
					While True
						If $arr[$i + $j] == "]" Or ($arr[$i + $j] <> "=" And $arr[$i + $j] <> "") Then
							ExitLoop
						EndIf
						$j += 1
					WEnd
					If $j - 1 == $multiStringEq Then
						$stringStarted = False
						Local $sz = UBound($strings)
						ReDim $strings[$sz + 1]
						$strings[$sz] = $i + $multiStringEq + 1
					EndIf



				EndIf


			Next
			ReDim $skips[UBound($comments) / 2 + UBound($strings) / 2][3]
			$skips_off = 0
			For $i = 0 To UBound($comments) / 2 - 1
				$skips[$i][0] = $comments[$i * 2]
				$skips[$i][1] = $comments[$i * 2 + 1]
				$skips[$i][2] = "comment"
				$skips_off += 1
			Next
			For $i = 0 To UBound($strings) / 2 - 1
				$skips[$i + $skips_off][0] = $strings[$i * 2]
				$skips[$i + $skips_off][1] = $strings[$i * 2 + 1]
				$skips[$i + $skips_off][2] = "string"
			Next
			_ArraySort($skips)
			;_ArrayDisplay($skips)
			;;we got all comments/strings, now parse all words

			Global $highlight[0][3]
			$pos = 0
			While True
				If $pos > $arr[0] Then ExitLoop
				$word = ""
				;MsgBox(0,$word,$pos)
				While True
					$pos += 1
					;check if we need to skip first:
					For $k = 0 To UBound($skips) - 1
						If $pos == $skips[$k][0] Then
							;MsgBox(0,"skipping",$skips[$k][0]&"-|"&$word&"|")
							If $word <> "" Then
								Local $rpos = $pos - StringLen($word)
								Local $sz = UBound($highlight)
								ReDim $highlight[$sz + 1][3]
								$highlight[$sz][0] = $rpos
								$highlight[$sz][1] = Evaluate($word)
								$highlight[$sz][2] = $word

							EndIf
							$pos = $skips[$k][1]
							$word = ""
							ExitLoop (2)
						EndIf
					Next
					;MsgBox(0,"pos",$pos)

					If $pos > $arr[0]  Then ExitLoop
					Local $char = $arr[$pos]
					If $char == @CR or $char == @LF or $char == " " then ExitLoop
					If isValueInArray($char, $wordTerminator) Then
						Local $sz = UBound($highlight)
						ReDim $highlight[$sz + 1][3]
						$highlight[$sz][0] = $pos
						$highlight[$sz][1] = "operator"
						;MsgBox(0,"op",$pos)
						ExitLoop
					EndIf
					$word &= $char
				WEnd
				If $word <> "" Then
					Local $rpos = $pos - StringLen($word)
					Local $sz = UBound($highlight)
					ReDim $highlight[$sz + 1][3]
					$highlight[$sz][0] = $rpos
					$highlight[$sz][1] = Evaluate($word)
					$highlight[$sz][2] = $word

					;MsgBox(0,$rpos,"|"&$word&"|")
				EndIf


			WEnd
			$szh = UBound($highlight)
			$szs = UBound($skips)
			;_ArrayDisplay($skips,"skips")
			;_ArrayDisplay($highlight,"$highlight before")
			ReDim $highlight[$szh+$szs][3]
			For $i=0 To $szs-1
				$highlight[$szh+$i][0] = $skips[$i][0]
				$highlight[$szh+$i][1] = $skips[$i][2]
			Next
			;_ArrayDisplay($highlight,"$highlight after")
			_ArraySort($highlight)
			;_ArrayDisplay($highlight,"$highlight soreted")

			;_ArrayDisplay($arr)
			$stringStarted = False
			$commentStarted = False
			Local $term = ""
			For $i=1 To $arr[0]
				If $arr[$i] == " " And Not $stringStarted and Not $commentStarted Then
					$output &= $term&" "
					$term = ""
					ContinueLoop
				EndIf
				For $j=0 To UBound($highlight)-1
					If $highlight[$j][0] == $i Then
							Local $type = $highlight[$j][1]
							If $type == "string" then $stringStarted = True
							If $type == "comment" then $commentStarted = True
							If $type <> "string" and $stringStarted Then $stringStarted = False
							If $type <> "comment" and $commentStarted Then $commentStarted = False
							If $type == "keyword" or $type == "builtinfunc"  Then
								$output &= $term&'<a href='&GetLink($highlight[$j][2])&' class=lua-'&$type&'>'
								$term = '</a>'
							Else
								$output&= $term&'<span class=lua-'&$highlight[$j][1]&'>'
								$term = '</span>'
							EndIf

;~ 						If $j=0 Then
;~ 							$output&='<span class=lua-'&$highlight[$j][1]&'>'
;~  							ExitLoop
;~  						EndIf
;~ 						If $highlight[$j-1][1] <> $highlight[$j][1] Then
;~ 							$output&='</span><span class=lua-'&$highlight[$j][1]&'>'
;~ 						Endif

					EndIf
				Next
			$output &= $arr[$i]
			Next
			$output&="</span>"
			;MsgBox(0,21323,$output)
			GUICtrlSetData($out,$output,"")
	EndSwitch
WEnd
Func GetLink($word)
	Local $ret = ""
	If isValueInArray($word,$keywords) Then
		If $word == "and" or $word == "or" or $word =="not" Then Return "../index.htm#1"
		If $word == "nil" or $word == "true" or $word =="false" Then Return "../index.htm#2"
		$ret = "../keywords/"
		If $word == "if" or $word=="then" Then
			$ret&="ifthen.htm"
			Return $ret
		EndIf
		If $word == "else" or $word == "elseif" Then
			$ret&="ifelse.htm"
			Return $ret
		EndIf
		If $word == "until" Then Return $ret&"repeat.htm"
		If $word == "return" then Return $ret&"function.htm"
		If $word == "for" then Return $ret&"numericfor.htm"
		If $word == "for" then Return $ret&"numericfor.htm"
		Return $ret&$word&".htm"
	EndIf
	Return $word&".htm"
EndFunc
Func Evaluate($word)
	;MsgBox(0,"eval",$word)
	If isValueInArray($word, $keywords) Then Return "keyword"
	If isValueInArray($word, $builtinFuncs) Then Return "builtinfunc"
	If StringRegExp($word,"[^0-9]") == 0 Then Return "number"
	If StringRegExp($word,"^0[xX]") == 1 Then Return "hex"
	Return "variable"
EndFunc   ;==>Evaluate
Func isValueInArray($value, $array)
	For $i = 0 To UBound($array) - 1
		If $value == $array[$i] Then Return True
	Next
	Return False
EndFunc   ;==>isValueInArray
