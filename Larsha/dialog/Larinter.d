
///VAELASA///
INTERJECT VAELASA 1 LARSHA_IJ0  
== "VAELASA" 
IF ~InParty("LARSHA")~ THEN @1 
== "LARSHAJ" 
IF ~InParty("LARSHA")~ THEN @2  
== "VAELASA" 
IF ~InParty("LARSHA")~ THEN @3  
== "LARSHAJ" 
IF ~InParty("LARSHA")~ THEN @4
END 
VAELASA 1

///SAMIA
INTERJECT SAMIA 26 LARSHA_IJ1    
== "LARSHAJ" 
IF ~InParty("LARSHA")~ THEN @5    
== "SAMIA" 
IF ~InParty("LARSHA")~ THEN @6
== "LARSHAJ" 
IF ~InParty("LARSHA")~ THEN @7 = @8 DO ~SetGlobal("mySli","GLOBAL",1)~
END 
SAMIA 18

///STRA¯NIK
INTERJECT DDGUARD1 0 LARSHA_IJ2    
== "LARSHAJ" 
IF ~InParty("LARSHA")~ THEN @9 = @10 = @11 = @12 = @13 = @14    
END 
DDGUARD1 1

///Irenicus
INTERJECT SUJON 13 LARSHA_IJ3 
== "LARSHAJ" 
IF ~InParty("LARSHA")~ THEN @15 = @16 = @17    
== "SUJON" 
IF ~InParty("LARSHA")~ THEN @18 = @19
== "LARSHAJ" 
IF ~InParty("LARSHA")~ THEN @20 = @21 = @22
DO ~SetGlobal("driada","GLOBAL",1)~
END
SUJON 14 