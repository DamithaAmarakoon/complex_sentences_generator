import java.io.*;

%%

%class Translator
%standalone
%state STRING

%{

String text2;

void append(String c){
  text2+=c;
}

void replace_func(String text) throws IOException{

  FileWriter myWriter = new FileWriter("../data/intermediate_out.txt");
  
  String[] vowels = new String[20];
  String[] vowelsUni = new String[20]; 
  String[] vowelModifiersUni = new String[20];
  String[] consonantsUni = new String[46];
  String[] consonants = new String[46];
  String[] specialConsonantsUni = new String[5];
  String[] specialConsonants = new String[5];
  String[] specialCharUni = new String[2];
  String[] specialChar = new String[2];
  
  
  vowelsUni[0]="\u0d8b";   vowels[0]="oo";    vowelModifiersUni[0]="\u0dd4";
  vowelsUni[1]="\u0d95";   vowels[1]="oe";    vowelModifiersUni[1]="\u0ddd";
  vowelsUni[2]="\u0d86";   vowels[2]="aa";    vowelModifiersUni[2]="\u0dcf";
  vowelsUni[3]="\u0d88";   vowels[3]="Aa";    vowelModifiersUni[3]="\u0dd1";
  vowelsUni[4]="\u0d88";   vowels[4]="ae";    vowelModifiersUni[4]="\u0dd1";
  vowelsUni[5]="\u0d8a";   vowels[5]="ii";    vowelModifiersUni[5]="\u0dd3";
  vowelsUni[6]="\u0d8a";   vowels[6]="ie";    vowelModifiersUni[6]="\u0dd3";
  vowelsUni[7]="\u0d8a";   vowels[7]="ee";    vowelModifiersUni[7]="\u0dd3";
  vowelsUni[8]="\u0d92";    vowels[8]="ea";    vowelModifiersUni[8]="\u0dda";
  vowelsUni[9]="\u0d92";   vowels[9]="ei";    vowelModifiersUni[9]="\u0dda";
  vowelsUni[10]="\u0d8c";   vowels[10]="uu";    vowelModifiersUni[10]="\u0dd6";
  vowelsUni[11]="\u0d96";   vowels[11]="au";    vowelModifiersUni[11]="\u0dde";
  vowelsUni[12]="\u0d87";   vowels[12]="/a";    vowelModifiersUni[12]="\u0dd0";
  
  vowelsUni[13]="\u0d85";  vowels[13]="a";    vowelModifiersUni[13]="";
  vowelsUni[14]="\u0d87";  vowels[14]="A";    vowelModifiersUni[14]="\u0dd0";
  vowelsUni[15]="\u0d89";  vowels[15]="i";    vowelModifiersUni[15]="\u0dd2";
  vowelsUni[16]="\u0d91";  vowels[16]="e";    vowelModifiersUni[16]="\u0dd9";
  vowelsUni[17]="\u0d8b";  vowels[17]="u";    vowelModifiersUni[17]="\u0dd4";
  vowelsUni[18]="\u0d94";  vowels[18]="o";    vowelModifiersUni[18]="\u0ddc";
  vowelsUni[19]="\u0d93";  vowels[19]="I";    vowelModifiersUni[19]="\u0ddb";
  
  specialConsonantsUni[0]="\u0d82"; specialConsonants[0]="\\n";
  specialConsonantsUni[1]="\u0d83"; specialConsonants[1]="/h";
  specialConsonantsUni[2]="\u0d9e"; specialConsonants[2]="/N";
  specialConsonantsUni[3]="\u0d8d"; specialConsonants[3]="/R";
  specialConsonantsUni[4]="\u0dbb"+"\u0dca"+"\u200D"; specialConsonants[4]="R";
  
  consonantsUni[0]="\u0dac"; consonants[0]="nnd";
  consonantsUni[1]="\u0db3"; consonants[1]="nndh";
  consonantsUni[2]="\u0d9f"; consonants[2]="nng";
  consonantsUni[3]="\u0dae"; consonants[3]="Th";
  consonantsUni[4]="\u0db0"; consonants[4]="Dh";
  consonantsUni[5]="\u0d9d"; consonants[5]="gh";
  consonantsUni[6]="\u0da1"; consonants[6]="Ch";
  consonantsUni[7]="\u0db5"; consonants[7]="ph";
  consonantsUni[8]="\u0db7"; consonants[8]="bh";
  consonantsUni[9]="\u0dc1"; consonants[9]="sh";
  consonantsUni[10]="\u0dc2"; consonants[10]="Sh";
  consonantsUni[11]="\u0da5"; consonants[11]="GN";
  consonantsUni[12]="\u0da4"; consonants[12]="KN";
  consonantsUni[13]="\u0dbd"; consonants[13]="Lu";
  consonantsUni[14]="\u0daf"; consonants[14]="dh";
  consonantsUni[15]="\u0da0"; consonants[15]="ch";
  consonantsUni[16]="\u0d9b"; consonants[16]="kh";
  consonantsUni[17]="\u0dad"; consonants[17]="th";
  consonantsUni[18]="\u0da7"; consonants[18]="t";
  consonantsUni[19]="\u0d9a"; consonants[19]="k";    
  consonantsUni[20]="\u0da9"; consonants[20]="d";
  consonantsUni[21]="\u0db1"; consonants[21]="n";
  consonantsUni[22]="\u0db4"; consonants[22]="p";
  consonantsUni[23]="\u0db6"; consonants[23]="b";
  consonantsUni[24]="\u0db8"; consonants[24]="m";   
  consonantsUni[25]="\u0dba"+"\u200D"; consonants[25]="\\u005c"+"y";
  consonantsUni[26]="\u0dba"; consonants[26]="Y";
  consonantsUni[27]="\u0dba"; consonants[27]="y";
  consonantsUni[28]="\u0da2"; consonants[28]="j";
  consonantsUni[29]="\u0dbd"; consonants[29]="l";
  consonantsUni[30]="\u0dc0"; consonants[30]="v";
  consonantsUni[31]="\u0dc0"; consonants[31]="w";
  consonantsUni[32]="\u0dc3"; consonants[32]="s";
  consonantsUni[33]="\u0dc4"; consonants[33]="h";
  consonantsUni[34]="\u0dab"; consonants[34]="N";
  consonantsUni[35]="\u0dc5"; consonants[35]="L";
  consonantsUni[36]="\u0d9b"; consonants[36]="K";
  consonantsUni[37]="\u0d9d"; consonants[37]="G";
  consonantsUni[38]="\u0da8"; consonants[38]="T";
  consonantsUni[39]="\u0daa"; consonants[39]="D";
  consonantsUni[40]="\u0db5"; consonants[40]="P";
  consonantsUni[41]="\u0db9"; consonants[41]="B";
  consonantsUni[42]="\u0dc6"; consonants[42]="f";
  consonantsUni[43]="\u0da3"; consonants[43]="q";
  consonantsUni[44]="\u0d9c"; consonants[44]="g";
  consonantsUni[45]="\u0dbb"; consonants[45]="r";
  
  specialCharUni[0]="\u0df2"; specialChar[0]="ruu";
  specialCharUni[1]="\u0df3"; specialChar[1]="ru";
  
  String text1 = "";
  int i = 0;
  String r;
  
  text1 = text1 + text; 
    
  for (int j = 0; j < specialConsonants.length; j++){
    text1 = text1.replace(specialConsonants[j], specialConsonantsUni[j]);
  }
  
  for (int k = 0; k < specialCharUni.length; k++){
    for (var j = 0; j < consonants.length; j++){
      String s = consonants[j] + specialChar[k];
      String v = consonantsUni[j] + specialCharUni[k];
      text1 = text1.replace(s, v);
    }
  }
  
  for (int j = 0;j < consonants.length; j++){
    for (int k = 0; k < vowels.length; k++){
      String s = consonants[j] + "r" + vowels[k];
      String v = consonantsUni[j] + "\u0dca" + "\u200D" + "\u0dbb" + vowelModifiersUni[k];
      text1 = text1.replace(s, v);
    }

    String s = consonants[j] + "r";
    String v = consonantsUni[j] + "\u0dca" + "\u0dbb";
    text1 = text1.replace(s, v);
  }
  
  for (int k = 0; k < consonants.length; k++){
    for (int j = 0; j < vowels.length; j++) { 
      String s = consonants[k] + vowels[j];
      String v = consonantsUni[k] + vowelModifiersUni[j];
      text1 = text1.replace(s, v);
    }
  }
  
  for (int j = 0; j < consonants.length; j++){
    text1 = text1.replaceAll(consonants[j], consonantsUni[j]+ "\u0dca");
  }
  
  for (int j = 0; j < vowels.length; j++){
    text1 = text1.replaceAll(vowels[j], vowelsUni[j]);
  }

  System.out.println("Writing the output to ../data/intermediate_out.txt");
  myWriter.write(text1.replaceAll("(?m)^[ \t]*\r?\n", ""));
  myWriter.close();
}

%}

beginningOfLine = [^.]
space = [\ \t]
endPunct = [\.\!\?]
otherPunct = [\,\;\:\-]

%%
<YYINITIAL>{
{beginningOfLine} {yybegin(STRING); text2 = "" + yytext();}
}
<STRING>{
[a-zA-Z0-9] {append(yytext());}
{space} {append(yytext());}
{otherPunct} {append(yytext());}
{endPunct} {append(yytext()); replace_func(text2);}
}

