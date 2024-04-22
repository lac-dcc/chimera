// SYNTAX TEST "Packages/sublime-vhdl/Syntaxes/VHDL.tmLanguage"
--http://www.vhdl.renerta.com/mobile/source/vhd00041.htm
--decimal_literal ::= integer [ . integer ] [ exponent ]
--integer ::= digit { [ underline ] digit }
--exponent ::= E [ + ] integer | E - integer
--based_literal ::= base # based_integer [ . based_integer ] # [ exponent ]
//<- source.vhdl comment.line.double-dash.vhdl

a <= 1
//<- source.vhdl
//^^ source.vhdl keyword.operator.vhdl
//   ^ source.vhdl constant.numeric.integer.vhdl
a <= 1_1_1_1
//   ^^^^^^^ source.vhdl constant.numeric.integer.vhdl
a <= 111_111E10
//   ^^^^^^^^^^ source.vhdl constant.numeric.integer.vhdl

a <= 1.0
//   ^^^ source.vhdl constant.numeric.floating_point.vhdl
a <= 1.0E2
//   ^^^^^ source.vhdl constant.numeric.floating_point.vhdl
a <= 1.0e2
//   ^^^^^ source.vhdl constant.numeric.floating_point.vhdl
a <= 1.0E+2
//   ^^^^^^ source.vhdl constant.numeric.floating_point.vhdl
a <= 1.0e-2
//   ^^^^^^ source.vhdl constant.numeric.floating_point.vhdl
a <= 16#BEEF#
//   ^^^^^^^^ source.vhdl constant.numeric.base_pound_number_pound.vhdl
a <= 2#1010_1010#;
//   ^^^^^^^^^^^^ source.vhdl constant.numeric.base_pound_number_pound.vhdl
a <= 2#10#
//   ^^^^^ source.vhdl constant.numeric.base_pound_number_pound.vhdl
a <= 2#12#e+6
//   ^^^^^^^^ source.vhdl constant.numeric.base_pound_number_pound.vhdl
a <= 2#1010_1010#E-5
//   ^^^^^^^^^^^^^^^ source.vhdl constant.numeric.base_pound_number_pound.vhdl
arr <= (16#BEEF#, 16#F00D#, 16#CAFE#)
//      ^^^^^^^^ source.vhdl constant.numeric.base_pound_number_pound.vhdl
//                ^^^^^^^^ source.vhdl constant.numeric.base_pound_number_pound.vhdl
//                          ^^^^^^^^ source.vhdl constant.numeric.base_pound_number_pound.vhdl
BIT_8_BUS <= B"1111_1111";
//           ^^^^^^^^^^^^ source.vhdl constant.numeric.quoted.double.string.binary.vhdl
BIT_9_BUS <= O"353";
//           ^^^^^^ source.vhdl constant.numeric.quoted.double.string.octal.vhdl
BIT_16_BUS <= X"AA55";
//            ^^^^^^^ source.vhdl constant.numeric.quoted.double.string.hex.vhdl
