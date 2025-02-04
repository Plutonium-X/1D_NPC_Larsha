

BEGIN Larsha


IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeeting
SAY @1
IF ~~ THEN REPLY @2 GOTO Powitanie
IF ~Class(Player1,Ranger)~ THEN REPLY @3 GOTO BothRangers
IF ~~ THEN REPLY @4 GOTO GoAway
END

IF ~~ THEN BEGIN BothRangers
SAY @5
IF ~~ THEN REPLY @6 GOTO GoAway
IF ~~ THEN REPLY @7 GOTO Powitanie
END

IF ~~ THEN BEGIN Powitanie
SAY @8 = @9 = @10 = @11
IF ~~ THEN REPLY @12 DO ~SetGlobal("LarshaJoined","LOCALS",1) JoinParty()~ EXIT
IF ~~ THEN REPLY @13 GOTO GoAway
END

IF ~~ THEN BEGIN GoAway
SAY @14
IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN ReturnDialogue
SAY @15
IF ~~ THEN REPLY @16 GOTO Powitanie
IF ~~ THEN REPLY @17 GOTO RefusedAgain
END

IF ~~ THEN BEGIN RefusedAgain
SAY @18
IF ~~ THEN EXIT
END


EXTEND_BOTTOM PLAYER1 33 
  IF ~InParty("larsha")~ 
    THEN EXTERN PLAYER1 tree_of_life
END

APPEND PLAYER1 
  IF ~~ THEN BEGIN tree_of_life
    SAY @102
    IF ~Global("LarshaRomanceActive","GLOBAL",2)~ THEN REPLY @103 EXTERN LarshaJ tol_1
    IF ~!Global("LarshaRomanceActive","GLOBAL",2)~ THEN REPLY @104 EXTERN LarshaJ tol_2
    IF ~!Global("LarshaRomanceActive","GLOBAL",2)~ THEN REPLY @105 EXTERN LarshaJ tol_2
  END
END


BEGIN LARSHAP


IF ~Global("LarshaJoined","LOCALS",1)~ THEN BEGIN KickOut1
SAY @19
IF ~~ THEN REPLY @20 DO ~JoinParty()~ EXIT
IF ~~ THEN REPLY @21 DO ~SetGlobal("LarshaJoined","LOCALS",0)~ EXIT
END

IF ~Global("LarshaJoined","LOCALS",0)~ THEN BEGIN KickOut2
SAY @22
IF ~~ THEN REPLY @23 DO ~SetGlobal("LarshaJoined","LOCALS",1) 
JoinParty()~ EXIT
IF ~~ THEN REPLY @24 EXIT
END


BEGIN LARSHAJ

IF ~Global("wampir","GLOBAL",0)
    !Dead("valen")
    InParty("Larsha")
    InParty("Valen")
    See("Valen")~ THEN BEGIN Wampir1
SAY @86 = @87 = @88
IF ~~ THEN DO ~SetGlobal("wampir","GLOBAL",1) Attack("valen")~ EXIT
END  


IF ~InParty("Larsha")
    InParty("Korgan")
    See("Korgan")~ THEN BEGIN krasnolud1
SAY @144 = @145 = @146 = @147
IF ~~ THEN DO ~LeaveParty()~ EXIT
END  

IF ~ReputationLT(Player1,8)~ THEN BEGIN Reputacja 
  SAY @89 = @90 = @91 = @92 = @93   
  IF ~~  THEN DO ~LeaveParty() EscapeArea()~ EXIT
END


IF ~Global("LarshaJoined","LOCALS",1)
    !InParty("Larsha")~ THEN BEGIN KickOut3
SAY @19
IF ~~ THEN REPLY @20 DO ~JoinParty()~ EXIT
IF ~~ THEN REPLY @21 DO ~SetGlobal("LarshaJoined","LOCALS",0)~ EXIT
END

IF ~Global("LarshaJoined","LOCALS",0)
    !InParty("Larsha")~ THEN BEGIN KickOut4
SAY @22
IF ~~ THEN REPLY @23 DO ~SetGlobal("LarshaJoined","LOCALS",1) 
JoinParty()~ EXIT
IF ~~ THEN REPLY @24 EXIT
END


IF ~InParty("Larsha")
    Global("rytual","GLOBAL",1)~ THEN BEGIN Rytual
  SAY @25= @26 = @27 = @28 = @29 = @30 
  IF ~~ THEN DO ~SetGlobal("rytual","GLOBAL",2)~ EXIT
END


IF ~Global("mysli","GLOBAL",0)
    XPGT(Myself,900000) 
    InParty("Larsha")~ THEN BEGIN mysli1
SAY @31  
IF ~~ THEN REPLY @32 DO ~SetGlobal("mysli","GLOBAL",1)~ GOTO mysli2
END

IF ~~ THEN BEGIN mysli2
SAY @33 = @34 = @35
IF ~~ THEN REPLY @36 GOTO mysli3
END

IF ~~ THEN BEGIN mysli3
SAY @37 = @38 = @39
IF ~~ THEN EXIT
END


IF ~Global("bronbant","GLOBAL",0)
    XPGT(Myself,1000000) 
    InParty("Larsha")~ THEN BEGIN Bronbant1
SAY @40  
IF ~~ THEN REPLY @41 DO ~SetGlobal("bronbant","GLOBAL",1)~ GOTO 2
IF ~~ THEN REPLY @42 DO ~SetGlobal("bronbant","GLOBAL",1)~ GOTO 1
IF ~~ THEN REPLY @43 DO ~SetGlobal("bronbant","GLOBAL",1)~ GOTO 1
IF ~~ THEN REPLY @44 DO ~SetGlobal("bronbant","GLOBAL",1)~ GOTO 3
IF ~~ THEN REPLY @45 DO ~SetGlobal("bronbant","GLOBAL",1)~ GOTO 2
END

IF ~~ THEN BEGIN 1
SAY @46
IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN 2
SAY @47 = @48 
IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN 3
SAY @49 = @50 
IF ~~ THEN EXIT
END


IF ~Global("bronbant","GLOBAL",1)
    HasItem("Larluk2",Myself) 
    XPGT(Myself,1500000) 
    InParty("Larsha")~ THEN BEGIN Bronbant2
SAY @51  
IF ~~ THEN REPLY @52 DO ~SetGlobal("bronbant","GLOBAL",2)~  EXIT
IF ~~ THEN REPLY @53 DO ~SetGlobal("bronbant","GLOBAL",2)~  GOTO 4
END

IF ~~ THEN BEGIN 4
SAY @54
IF ~~ THEN REPLY @55 GOTO 5
END

IF ~~ THEN BEGIN 5
SAY @56
IF ~~ THEN EXIT
END


IF ~Global("bronbant","GLOBAL",2)
    HasItem("Larluk3",Myself) 
    XPGT(Myself,2200000) 
    InParty("Larsha")~ THEN BEGIN Bronbant3
SAY @57   
IF ~~ THEN REPLY @58 DO ~SetGlobal("bronbant","GLOBAL",3)~  GOTO 6
END

IF ~~ THEN BEGIN 6
SAY @59 = @60 = @61 = @62 = @63 
IF ~~ THEN REPLY @64 GOTO 7
IF ~~ THEN REPLY @65 GOTO 7
END

IF ~~ THEN BEGIN 7
SAY @66
IF ~~ THEN EXIT
END



IF ~Global("bronbant","GLOBAL",3)
    XPGT(Myself,2500000) 
    InParty("Larsha")~ THEN BEGIN Bronbant4
SAY @67  
IF ~~ THEN REPLY @68 GOTO 8
IF ~~ THEN REPLY @69 DO ~SetGlobal("bronbant","GLOBAL",10)~ GOTO 9
END

IF ~~ THEN BEGIN 8
SAY @70 = @71 = @72 = @73 = @74 = @75 = @76
IF ~~ THEN REPLY @77 DO ~SetGlobal("bronbant","GLOBAL",4)~ GOTO 10
IF ~~ THEN REPLY @78 DO ~SetGlobal("bronbant","GLOBAL",10)~ GOTO 9
IF ~~ THEN REPLY @79 DO ~SetGlobal("bronbant","GLOBAL",4)~ GOTO 11
END

IF ~~ THEN BEGIN 9
SAY @80 = @81  
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 10
SAY @82
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 11
SAY @83 = @84 = @85
IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN tol_1
  SAY @106 = @107 = @108 = @109 = @110 
   COPY_TRANS PLAYER1 33
END

IF ~~ THEN BEGIN tol_2
  SAY @107 = @108 = @109 = @110 
  COPY_TRANS PLAYER1 33
END


IF ~Global("LarshaRomance","GLOBAL",0)
    Global("LarshaRomanceActive","GLOBAL",0)
    !Global("bronbant","GLOBAL",10)
    XPGT(Myself,2900000) 
    Global("LarshaMatch","GLOBAL",1)
    Gender(Player1,MALE)
    InParty("Larsha")~ THEN BEGIN Romans1
SAY @111
IF ~~ THEN REPLY @112 DO ~SetGlobal("LarshaRomance","GLOBAL",1) SetGlobal("LarshaRomanceActive","GLOBAL",1)~ GOTO 12
IF ~~ THEN REPLY @113 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",3)~ GOTO 14
IF ~Class(Player1,Ranger)~ THEN REPLY @114 DO ~SetGlobal("LarshaRomance","GLOBAL",1)  SetGlobal("LarshaRomanceActive","GLOBAL",1)~ GOTO 12
IF ~!Class(Player1,Ranger)~ THEN REPLY @115 DO ~SetGlobal("LarshaRomance","GLOBAL",1) SetGlobal("LarshaRomanceActive","GLOBAL",1)~ GOTO 13
IF ~Class(Player1,Ranger)~ THEN REPLY @116 DO ~SetGlobal("LarshaRomance","GLOBAL",1)  SetGlobal("LarshaRomanceActive","GLOBAL",1)~ GOTO 13
IF ~~ THEN REPLY @117 DO ~SetGlobal("LarshaRomance","GLOBAL",1)  SetGlobal("LarshaRomanceActive","GLOBAL",1)~ GOTO 12
END

IF ~~ THEN BEGIN 12
SAY @118 = @119 = @120
IF ~~ THEN REPLY @121 GOTO 13
IF ~~ THEN REPLY @122 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",3)~ GOTO 14
END


IF ~~ THEN BEGIN 13
  SAY @123 = @124 = @125 = @126 = @127
IF ~~ THEN REPLY @128 GOTO 15
IF ~~ THEN REPLY @129 GOTO 15
IF ~~ THEN REPLY @130 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",3)~ GOTO 14
IF ~Class(Player1,Ranger)~ THEN REPLY @131 GOTO 17
END

IF ~~ THEN BEGIN 14
  SAY @132 
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 15
  SAY @133 = @134 = @135 = @136 = @137 = @138 = @139 = @140
IF ~~ THEN REPLY @141 GOTO 16
END

IF ~~ THEN BEGIN 16
  SAY @142
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 17
  SAY @143
  IF ~~ THEN EXIT
END


IF ~Global("LarshaRomance","GLOBAL",1)
    Global("LarshaRomanceActive","GLOBAL",1)
    !Global("bronbant","GLOBAL",10)
    XPGT(Myself,3600000) 
    Global("LarshaMatch","GLOBAL",1)
    Gender(Player1,MALE)
    InParty("Larsha")~ THEN BEGIN Romans2
SAY @148 
IF ~!Global("AerieRomanceActive","GLOBAL",2) !Global("ViconiaRomanceActive","GLOBAL",2)  !Global("JaheiraRomanceActive","GLOBAL",2)~ THEN REPLY @149 DO ~SetGlobal("LarshaRomance","GLOBAL",2)~ GOTO 18
IF ~~ THEN REPLY @150 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",3)~ GOTO 22
IF ~~ THEN REPLY @151 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",3)~ GOTO 14
IF ~~ THEN REPLY @152 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",3)~ GOTO 14
IF ~~ THEN REPLY @153 DO ~SetGlobal("LarshaRomance","GLOBAL",2)~ GOTO 20
END

IF ~~ THEN BEGIN 18
  SAY @154 = @155
IF ~~ THEN REPLY @156 GOTO 19
END

IF ~~ THEN BEGIN 19
  SAY @157
IF ~~ THEN REPLY @158 GOTO 20
END


IF ~~ THEN BEGIN 20
  SAY @159 = @160 = @161 = @162 = @163 = @164 = @165 = @166
IF ~~ THEN REPLY @167 GOTO 21
IF ~~ THEN REPLY @168 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",3)~ GOTO 17
END

IF ~~ THEN BEGIN 21
  SAY @169 = @170 = @171 = @172
IF ~!Alignment(Player1,MASK_GOOD)~ THEN REPLY @173 GOTO 23
IF ~Alignment(Player1,MASK_GOOD) ReputationLT(Player1,10)~ THEN REPLY @174 GOTO 23
IF ~~ THEN REPLY @175 GOTO 23
IF ~OR(3)
    Global("AerieRomanceActive","GLOBAL",2) 
    Global("ViconiaRomanceActive","GLOBAL",2)  
    Global("JaheiraRomanceActive","GLOBAL",2)~ THEN REPLY @176 GOTO 23
END

IF ~~ THEN BEGIN 22
  SAY @177 = @178 = @179
IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN 23
  SAY @180 = @181
IF ~~ THEN EXIT
END


IF ~Global("LarshaRomance","GLOBAL",2)
    Global("LarshaRomanceActive","GLOBAL",1)
    !Global("bronbant","GLOBAL",10)
    XPGT(Myself,4000000) 
    Global("LarshaMatch","GLOBAL",1)
    Gender(Player1,MALE)
    InParty("Larsha")~ THEN BEGIN Romans3
SAY @182 = @183 = @184
IF ~~ THEN REPLY @185 GOTO 24
IF ~~ THEN REPLY @186 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",3)~ GOTO 25
END

IF ~~ THEN BEGIN 25
  SAY @187 = @188
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 24
  SAY @189 = @190 = @191 = @192 
IF ~!Global("AerieRomanceActive","GLOBAL",2) !Global("ViconiaRomanceActive","GLOBAL",2)  !Global("JaheiraRomanceActive","GLOBAL",2)~ THEN REPLY @193 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",2)~ GOTO 26 
IF ~Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @194 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",3)~ GOTO 25
IF ~Global("ViconiaRomanceActive","GLOBAL",2)~ THEN REPLY @195 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",3)~ GOTO 25
IF ~Global("JaheiraRomanceActive","GLOBAL",2)~ THEN REPLY @196 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",3)~ GOTO 25
IF ~Global("AerieRomanceActive","GLOBAL",2)~ THEN REPLY @197 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",2) SetGlobal("AerieRomanceActive","GLOBAL",3)~ GOTO 26
IF ~Global("ViconiaRomanceActive","GLOBAL",2)~ THEN REPLY @198 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",2) SetGlobal("ViconiaRomanceActive","GLOBAL",3)~ GOTO 26
IF ~Global("JaheiraRomanceActive","GLOBAL",2)~ THEN REPLY @199 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",2) SetGlobal("JaheiraRomanceActive","GLOBAL",3)~ GOTO 26
IF ~~ THEN REPLY @200 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",3)~ GOTO 25
IF ~~ THEN REPLY @210 DO ~SetGlobal("LarshaRomanceActive","GLOBAL",2) SetGlobal("AerieRomanceActive","GLOBAL",3) SetGlobal("ViconiaRomanceActive","GLOBAL",3)  SetGlobal("JaheiraRomanceActive","GLOBAL",3)~ GOTO 26
END

IF ~~ THEN BEGIN 26
  SAY @201 = @202
IF ~!Alignment(Player1,MASK_GOOD)~ THEN REPLY @203 DO ~SetGlobal("dobro","GLOBAL",1)~ GOTO 27
IF ~Alignment(Player1,MASK_GOOD) ReputationLT(Player1,10)~ THEN REPLY @204 DO ~SetGlobal("dobro","GLOBAL",2)~ GOTO 27
IF ~Alignment(Player1,MASK_GOOD) ReputationGT(Player1,9)~ THEN REPLY @205 DO ~SetGlobal("dobro","GLOBAL",3)~ GOTO 28
END


IF ~~ THEN BEGIN 27
  SAY @206
IF ~~ THEN EXIT 
END


IF ~~ THEN BEGIN 28
  SAY @207
IF ~~ THEN EXIT
END


IF ~Global("zdrada","GLOBAL",0)
    Global("LarshaRomanceActive","GLOBAL",2)
    InParty("Larsha")
  OR(3)
    Global("AerieRomanceActive","GLOBAL",2)
    Global("ViconiaRomanceActive","GLOBAL",2)
    Global("JaheiraRomanceActive","GLOBAL",2)~ THEN BEGIN zdrada1
SAY @208 = @209
  IF ~~  THEN DO ~SetGlobal("zdrada","GLOBAL",1)~ EXIT
END


IF ~Global("zdrada","GLOBAL",2)
    InParty("larsha")~ THEN BEGIN zdrada2
SAY @211 = @212
  IF ~~  THEN DO ~LeaveParty() EscapeArea()~ EXIT
END



