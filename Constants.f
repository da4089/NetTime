// Declare some of the global functions which are currently unknown to the "Newton 2.1" platform file://DeclareGlobalFn('TimeInSecondsToTime, 1);DeclareGlobalFn('SetTimeInSeconds, 1);DeclareGlobalFn('DSTOffset, 2);DeclareGlobalFn('SafeFreezePackage, 1);DeclareGlobalFn('DateFromSeconds, 1);// Get our "your clock has been set" chime sound from our resource file//OpenResFile(HOME & "NetTime.rsrc");DefineGlobalConstant('kNetTimeChime, GetSound11Deprecated("Bell"));CloseResFile();// Define a couple userconfig slots that we're going to store out data in.// We use userconfig because two slots doesn't really warrant creating an entirely new preferences soup.//constant kNetTimeHostSymbol := '|NetTimeHost:DTS|;					// UserConfig slot which holds our NetTime server address (name or IP address)constant kNetTimeMaxDeltaSymbol := '|NetTimeMaxDelta:DTS|;		// UserConfig slot which holds the max acceptable delta// This constant specifies the userconfig slot which is updated every time an NIE service is added or removed.// We use it as a trigger to let us know when to test for the RegInetLinkStatusChange API.// This eliminates problems with package loading order (i.e. NetTime might load before NIE).//constant kInetServicesSymbol := '|InetServices:NIE|;