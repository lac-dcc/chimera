// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

// class zero delay library for functional test only
//
// all gates have zero delay for maximum simulation speed
// registers and latches have a delay of one to avoid simulation ordering problems
// Verilog built-in or user defined primitives are used because they
// are accelerated by verilog and run much faster than hdl code
// Verilog primitive state definition:
// 0=0,1=1,x=unknown,?=(0,1 or x),b=(0 or 1)
// r=rising edge,f=falling edge,*=rising or falling edge
// -=keep last state (for registers and latchs, etc)
//

// GATES

module AN2(Z,A,B);
  input A,B;
  output Z;
  and (Z,A,B);
endmodule

module AN2I(Z,A,B);
  input A,B;
  output Z;
  and (Z,A,B);
endmodule

module OR2(Z,A,B);
  input A,B;
  output Z;
  or (Z,A,B);
endmodule

module OR2I(Z,A,B);
  input A,B;
  output Z;
  or (Z,A,B);
endmodule

module IV(Z,A);
  input A;
  output Z;
  not (Z,A);
endmodule

module IVI(Z,A);
  input A;
  output Z;
  not (Z,A);
endmodule

module IVP(Z,A);
  input A;
  output Z;
  not (Z,A);
endmodule

module IVA(Z,A);
  input A;
  output Z;
  not (Z,A);
endmodule

module IVAP(Z,A);
  input A;
  output Z;
  not (Z,A);
endmodule

module IVDA(Z,Y,A);
  input A;
  output Z,Y;
  not (Y,A);
  buf (Z,A);
endmodule

module IVDAP(Z,Y,A);
  input A;
  output Z,Y;
  not (Y,A);
  buf (Z,A);
endmodule

module B5I(Z,A);
  input A;
  output Z;
  not (Z,A);
endmodule

module B5IP(Z,A);
  input A;
  output Z;
  not (Z,A);
endmodule

module B4I(Z,A);
  input A;
  output Z;
  not (Z,A);
endmodule

module B4IP(Z,A);
  input A;
  output Z;
  not (Z,A);
endmodule

module ND2(Z,A,B);
  input A,B;
  output Z;
  nand (Z,A,B);
endmodule

module ND2I(Z,A,B);
  input A,B;
  output Z;
  nand (Z,A,B);
endmodule

module ND2P(Z,A,B);
  input A,B;
  output Z;
  nand (Z,A,B);
endmodule

module NR2(Z,A,B);
  input A,B;
  output Z;
  nor (Z,A,B);
endmodule

module NR2I(Z,A,B);
  input A,B;
  output Z;
  nor (Z,A,B);
endmodule

module NR2P(Z,A,B);
  input A,B;
  output Z;
  nor (Z,A,B);
endmodule

module EN(Z,A,B);
  input A,B;
  output Z;
  xnor (Z,A,B);
endmodule

module ENI(Z,A,B);
  input A,B;
  output Z;
  xnor (Z,A,B);
endmodule

module EO(Z,A,B);
  input A,B;
  output Z;
  xor (Z,A,B);
endmodule

module EOI(Z,A,B);
  input A,B;
  output Z;
  xor (Z,A,B);
endmodule

module ND3(Z,A,B,C);
  input A,B,C;
  output Z;
  nand (Z,A,B,C);
endmodule

module ND3P(Z,A,B,C);
  input A,B,C;
  output Z;
  nand (Z,A,B,C);
endmodule

module NR3(Z,A,B,C);
  input A,B,C;
  output Z;
  nor (Z,A,B,C);
endmodule

module NR3P(Z,A,B,C);
  input A,B,C;
  output Z;
  nor (Z,A,B,C);
endmodule

module AN3(Z,A,B,C);
  input A,B,C;
  output Z;
  and (Z,A,B,C);
endmodule

module OR3(Z,A,B,C);
  input A,B,C;
  output Z;
  or (Z,A,B,C);
endmodule

module ND4(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  nand (Z,A,B,C,D);
endmodule

module ND4P(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  nand (Z,A,B,C,D);
endmodule

module NR4(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  nor (Z,A,B,C,D);
endmodule

module ND5(Z,A,B,C,D,E);
  input A,B,C,D,E;
  output Z;
  nand (Z,A,B,C,D,E);
endmodule

module AO6(Z,A,B,C);
  input A,B,C;
  output Z;
  p_ao6(Z,A,B,C);
endmodule

module AO6P(Z,A,B,C);
  input A,B,C;
  output Z;
  p_ao6(Z,A,B,C);
endmodule

primitive p_ao6(Z,A,B,C);
  input A,B,C;
  output Z;
  table
//  A B C : Z
    ? ? 1 : 0;
    0 ? 0 : 1;
    ? 0 0 : 1;
    1 1 ? : 0;
  endtable
endprimitive

module AO7(Z,A,B,C);
  input A,B,C;
  output Z;
  p_ao7(Z,A,B,C);
endmodule

module AO7P(Z,A,B,C);
  input A,B,C;
  output Z;
  p_ao7(Z,A,B,C);
endmodule

primitive p_ao7(Z,A,B,C);
  input A,B,C;
  output Z;
  table
//  A B C : Z
    ? ? 0 : 1;
    1 ? 1 : 0;
    ? 1 1 : 0;
    0 0 ? : 1; // changed EBP 5/7/92 was 0 0 1 which was wrong
  endtable
endprimitive

module AO2(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  p_ao2(Z,A,B,C,D);
endmodule

module AO2P(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  p_ao2(Z,A,B,C,D);
endmodule

primitive p_ao2(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  table
//  A B C D : Z
    1 1 ? ? : 0;
    ? ? 1 1 : 0;
    0 ? 0 ? : 1;
    0 ? ? 0 : 1;
    ? 0 ? 0 : 1;
    ? 0 0 ? : 1;
  endtable
endprimitive

module AO4(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  p_ao4(Z,A,B,C,D);
endmodule

module AO4P(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  p_ao4(Z,A,B,C,D);
endmodule

primitive p_ao4(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  table
//  A B C D : Z
    0 0 ? ? : 1;
    ? ? 0 0 : 1;
    1 ? 1 ? : 0;
    ? 1 1 ? : 0;
    1 ? ? 1 : 0;
    ? 1 ? 1 : 0;
  endtable
endprimitive

module AO1(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  p_ao1(Z,A,B,C,D);
endmodule

primitive p_ao1(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  table
//  A B C D : Z
    1 1 ? ? : 0;
    ? ? 1 ? : 0;
    ? ? ? 1 : 0;
    ? 0 0 0 : 1;
    0 ? 0 0 : 1;
  endtable
endprimitive

module AO3(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  p_ao3(Z,A,B,C,D);
endmodule

// module AO3P(Z,A,B,C,D);
//   input A,B,C,D;
//   output Z;
//   p_ao3(Z,A,B,C,D);
// endmodule

primitive p_ao3(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  table
//  A B C D : Z
    1 ? 1 1 : 0;
    ? 1 1 1 : 0;
    0 0 ? ? : 1;
    ? ? 0 ? : 1;
    ? ? ? 0 : 1;
  endtable
endprimitive

module AN2P(Z,A,B);
  input A,B;
  output Z;
  and (Z,A,B);
endmodule

module AN3P(Z,A,B,C);
  input A,B,C;
  output Z;
  and (Z,A,B,C);
endmodule

module AN4(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  and (Z,A,B,C,D);
endmodule

module AN4P(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  and (Z,A,B,C,D);
endmodule

module OR2P(Z,A,B);
  input A,B;
  output Z;
  or (Z,A,B);
endmodule

module OR3P(Z,A,B,C);
  input A,B,C;
  output Z;
  or (Z,A,B,C);
endmodule

module OR4(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  or (Z,A,B,C,D);
endmodule

module OR4P(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  or (Z,A,B,C,D);
endmodule

module MUX21H(Z,S,A,B);
  input S,A,B;
  output Z;
  p_mux21h (Z,S,A,B);
endmodule

primitive p_mux21h(Z,S,A,B);
  input S,A,B;
  output Z;
  table
//  S A B : Z
    0 0 ? : 0;
    0 1 ? : 1;
    1 ? 0 : 0;
    1 ? 1 : 1;
    x 0 0 : 0;
    x 1 1 : 1;
  endtable
endprimitive

module NR5(Z,A,B,C,D,E);
  input A,B,C,D,E;
  output Z;
  nor (Z,A,B,C,D,E);
endmodule

module ND6(Z,A,B,C,D,E,F);
  input A,B,C,D,E,F;
  output Z;
  nand (Z,A,B,C,D,E,F);
endmodule

module NR6(Z,A,B,C,D,E,F);
  input A,B,C,D,E,F;
  output Z;
  nor (Z,A,B,C,D,E,F);
endmodule

module ND8(Z,A,B,C,D,E,F,G,H);
  input A,B,C,D,E,F,G,H;
  output Z;
  nand (Z,A,B,C,D,E,F,G,H);
endmodule

module NR8(Z,A,B,C,D,E,F,G,H);
  input A,B,C,D,E,F,G,H;
  output Z;
  nor (Z,A,B,C,D,E,F,G,H);
endmodule

module EON1(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  p_eon1 (Z,A,B,C,D);
endmodule

primitive p_eon1(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  table
//  A B C D : Z
    ? ? 1 1 : 1;
    1 ? 0 ? : 0;
    ? 1 0 ? : 0;
    1 ? ? 0 : 0;
    ? 1 ? 0 : 0;
    0 0 ? ? : 1;
  endtable
endprimitive

module EO1(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  p_eo1 (Z,A,B,C,D);
endmodule

primitive p_eo1(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  table
//  A B C D : Z
    1 1 ? ? : 0;
    0 ? 1 ? : 1;
    0 ? ? 1 : 1;
    ? 0 1 ? : 1;
    ? 0 ? 1 : 1;
    ? ? 0 0 : 0;
  endtable
endprimitive

module ND5P(Z,A,B,C,D,E);
  input A,B,C,D,E;
  output Z;
  nand (Z,A,B,C,D,E);
endmodule

module NR5P(Z,A,B,C,D,E);
  input A,B,C,D,E;
  output Z;
  nor (Z,A,B,C,D,E);
endmodule

module ND6P(Z,A,B,C,D,E,F);
  input A,B,C,D,E,F;
  output Z;
  nand (Z,A,B,C,D,E,F);
endmodule

module NR6P(Z,A,B,C,D,E,F);
  input A,B,C,D,E,F;
  output Z;
  nor (Z,A,B,C,D,E,F);
endmodule

module ND8P(Z,A,B,C,D,E,F,G,H);
  input A,B,C,D,E,F,G,H;
  output Z;
  nand (Z,A,B,C,D,E,F,G,H);
endmodule

module NR8P(Z,A,B,C,D,E,F,G,H);
  input A,B,C,D,E,F,G,H;
  output Z;
  nor (Z,A,B,C,D,E,F,G,H);
endmodule

module NR16(Z,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15);
  input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15;
  output Z;
  nor (Z,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15);
endmodule

module NR16P(Z,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15);
  input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15;
  output Z;
  nor (Z,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15);
endmodule

module ENP(Z,A,B);
  input A,B;
  output Z;
  xnor (Z,A,B);
endmodule

module EOP(Z,A,B);
  input A,B;
  output Z;
  xor (Z,A,B);
endmodule

module EO1P(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  p_eo1 (Z,A,B,C,D);
endmodule

module EON1P(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  p_eon1 (Z,A,B,C,D);
endmodule

module AO1P(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  p_ao1(Z,A,B,C,D);
endmodule

module AO3P(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  p_ao3(Z,A,B,C,D);
endmodule

module MUX21HP(Z,S,A,B);
  input S,A,B;
  output Z;
  p_mux21h (Z,S,A,B);
endmodule

module MUX21L(Z,S,A,B);
  input S,A,B;
  output Z;
  p_mux21l (Z,S,A,B);
endmodule

module MUX21LP(Z,S,A,B);
  input S,A,B;
  output Z;
  p_mux21l (Z,S,A,B);
endmodule

primitive p_mux21l(Z,S,A,B);
  input S,A,B;
  output Z;
  table
//  S A B : Z
    0 0 ? : 1;
    0 1 ? : 0;
    1 ? 0 : 1;
    1 ? 1 : 0;
    x 0 0 : 1;
    x 1 1 : 0;
  endtable
endprimitive

module MUX31L(Z,A,B,D0,D1,D2);
  input A,B,D0,D1,D2;
  output Z;
  p_mux31l (Z,A,B,D0,D1,D2);
endmodule

module MUX31LP(Z,A,B,D0,D1,D2);
  input A,B,D0,D1,D2;
  output Z;
  p_mux31l (Z,A,B,D0,D1,D2);
endmodule

primitive p_mux31l(Z,A,B,D0,D1,D2);
  input A,B,D0,D1,D2;
  output Z;
  table
//  A B D0 D1 D2 : Z
    0 0  0  ?  ? : 1;
    0 0  1  ?  ? : 0;
    1 0  ?  0  ? : 1;
    1 0  ?  1  ? : 0;
    ? 1  ?  ?  0 : 1;
    ? 1  ?  ?  1 : 0;
    x 0  0  0  ? : 1;
    x 0  1  1  ? : 0;
    x x  0  0  0 : 1;
    x x  1  1  1 : 0;
    0 x  0  ?  0 : 1;
    0 x  1  ?  1 : 0;
    1 x  ?  0  0 : 1;
    1 x  ?  1  1 : 0;
  endtable
endprimitive

module MUX21LA(Z,S,SN,A,B);
  input S,SN,A,B;
  output Z;
  p_mux21la (Z,S,SN,A,B);
endmodule

primitive p_mux21la(Z,S,SN,A,B);
  input S,SN,A,B;
  output Z;
  table
//  S SN A B : Z
    1  0 ? 0 : 1;
    1  0 ? 1 : 0;
    0  1 0 ? : 1;
    0  1 1 ? : 0;
    1  1 0 0 : 1;
    1  1 1 1 : 0;
    1  x 0 0 : 1;
    1  x 1 1 : 0;
    x  1 0 0 : 1;
    x  1 1 1 : 0;
  endtable
endprimitive

module AO5(Z,A,B,C);
  input A,B,C;
  output Z;
  p_ao5(Z,A,B,C);
endmodule

module AO5P(Z,A,B,C);
  input A,B,C;
  output Z;
  p_ao5(Z,A,B,C);
endmodule

primitive p_ao5(Z,A,B,C);
  input A,B,C;
  output Z;
  table
//  A B C : Z
    1 1 ? : 0;
    1 ? 1 : 0;
    ? 1 1 : 0;
    0 0 ? : 1;
    0 ? 0 : 1;
    ? 0 0 : 1;
  endtable
endprimitive

module EN3(Z,A,B,C);
  input A,B,C;
  output Z;
  xnor (Z,A,B,C);
endmodule

module EN3P(Z,A,B,C);
  input A,B,C;
  output Z;
  xnor (Z,A,B,C);
endmodule

module EO3(Z,A,B,C);
  input A,B,C;
  output Z;
  xor (Z,A,B,C);
endmodule

module EO3P(Z,A,B,C);
  input A,B,C;
  output Z;
  xor (Z,A,B,C);
endmodule

module MUX21LAP(Z,S,SN,A,B);
  input S,SN,A,B;
  output Z;
  p_mux21la (Z,S,SN,A,B);
endmodule

module NR4P(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  nor (Z,A,B,C,D);
endmodule

module FD1(D, CP, Q, QN);
  output Q, QN;
  input D, CP;
  p_dreg #1 (Q,CP,D);
  not (QN,Q);
endmodule

primitive p_dreg(q,cp,d);
  output q;
  reg q;
  input cp,d;
  table
// cp d : present q : next q
    r 0 : ? : 0;
    r 1 : ? : 1;
    f ? : ? : -;
    b * : ? : -;
    x 0 : 0 : 0;
    x 1 : 1 : 1;
  endtable
endprimitive

module FD1S(D, CP, TI, TE, Q, QN);
  output Q, QN;
  input D,CP,TI,TE;
  p_dregscan #1 (Q,CP,D,TI,TE);
  not (QN,Q);
endmodule

primitive p_dregscan(q,cp,d,ti,te);
  output q;
  reg q;
  input cp,d,ti,te;
  table
// cp d ti te : present q : next q
// normal mode
    r 0  ?  0 : ? : 0;
    r 1  ?  0 : ? : 1;
    f ?  ?  ? : ? : -;
    b *  ?  ? : ? : -;
    b ?  *  ? : ? : -;
    b ?  ?  * : ? : -;
    x 0  ?  0 : 0 : 0;
    x 1  ?  0 : 1 : 1;
// scan mode
    r ?  0  1 : ? : 0;
    r ?  1  1 : ? : 1;
    x ?  0  1 : 0 : 0;
    x ?  1  1 : 1 : 1;
// scan enable undefined
    r 0  0  x : ? : 0;
    r 1  1  x : ? : 1;
    x 0  0  x : 0 : 0;
    x 1  1  x : 1 : 1;
  endtable
endprimitive

module FD2(D, CP, Q, QN,CD);
  output Q, QN;
  input D, CP,CD;
  p_dregclear #1 (Q,CP,D,CD);
  not (QN,Q);
endmodule

primitive p_dregclear(q,cp,d,cd);
  output q;
  reg q;
  input cp,d,cd;
  table
// cp d cd : present q : next q
// clear mode
    ? ?  0 : ? : 0;
    b ?  * : 0 : 0;  // EBP changed x to * 5/7/92
    r 0  x : ? : 0;
// normal mode
    r 0  1 : ? : 0;
    r 1  1 : ? : 1;
    f ?  1 : ? : -;
    b *  1 : ? : -;
    x 0  1 : 0 : 0;
    x 1  1 : 1 : 1;
  endtable
endprimitive

module FD2S(D, CP, TI, TE, Q, QN,CD);
  output Q, QN;
  input D,CP,TI,TE,CD;
  p_dregscanclear #1 (Q,CP,D,TI,TE,CD);
  not (QN,Q);
endmodule

primitive p_dregscanclear(q,cp,d,ti,te,cd);
  output q;
  reg q;
  input cp,d,ti,te,cd;
  table
// cp d ti te cd : present q : next q
// clear mode
    ? ?  ?  ?  0 : ? : 0;
    b ?  ?  ?  * : 0 : 0; // EBP changed x to * 5/7/92
    r 0  ?  0  x : ? : 0;
    r ?  0  1  x : ? : 0;
    r 0  0  x  x : ? : 0;
// normal mode
    r 0  ?  0  1 : ? : 0;
    r 1  ?  0  1 : ? : 1;
    f ?  ?  ?  1 : ? : -;
    b *  ?  ?  1 : ? : -;
    b ?  *  ?  1 : ? : -;
    b ?  ?  *  1 : ? : -;
    x 0  ?  0  1 : 0 : 0;
    x 1  ?  0  1 : 1 : 1;
// scan mode
    r ?  0  1  1 : ? : 0;
    r ?  1  1  1 : ? : 1;
    x ?  0  1  1 : 0 : 0;
    x ?  1  1  1 : 1 : 1;
// scan enable undefined
    r 0  0  x  1 : ? : 0;
    r 1  1  x  1 : ? : 1;
    x 0  0  x  1 : 0 : 0;
    x 1  1  x  1 : 1 : 1;
  endtable
endprimitive

module FD4(D, CP, Q, QN,SD);
  output Q, QN;
  input D, CP,SD;
  not (QN,Q);
  p_dregset #1 (Q,CP,D,SD);
endmodule

primitive p_dregset(q,cp,d,sd);
  output q;
  reg q;
  input cp,d,sd;
  table
// cp d sd : present q : next q
// set mode
    ? ?  0 : ? : 1;
    b ?  * : 1 : 1; // EBP changed x to * 5/7/92
    r 1  x : ? : 1;
// normal mode
    r 0  1 : ? : 0;
    r 1  1 : ? : 1;
    f ?  1 : ? : -;
    b *  1 : ? : -;
    x 0  1 : 0 : 0;
    x 1  1 : 1 : 1;
  endtable
endprimitive

module FD4S(D, CP, TI, TE, Q, QN,SD);
  output Q, QN;
  input D,CP,TI,TE,SD;
  not (QN,Q);
  p_dregscanset #1 (Q,CP,D,TI,TE,SD);
endmodule

primitive p_dregscanset(q,cp,d,ti,te,sd);
  output q;
  reg q;
  input cp,d,ti,te,sd;
  table
// cp d ti te sd : present q : next q
// set mode
    ? ?  ?  ?  0 : ? : 1;
    b ?  ?  ?  * : 1 : 1; // EBP changed x to * 5/7/92
    r 1  ?  0  x : ? : 1;
    r ?  1  1  x : ? : 1;
    r 1  1  x  x : ? : 1;
// normal mode
    r 0  ?  0  1 : ? : 0;
    r 1  ?  0  1 : ? : 1;
    f ?  ?  ?  1 : ? : -;
    b *  ?  ?  1 : ? : -;
    b ?  *  ?  1 : ? : -;
    b ?  ?  *  1 : ? : -;
    x 0  ?  0  1 : 0 : 0;
    x 1  ?  0  1 : 1 : 1;
// scan mode
    r ?  0  1  1 : ? : 0;
    r ?  1  1  1 : ? : 1;
    x ?  0  1  1 : 0 : 0;
    x ?  1  1  1 : 1 : 1;
// scan enable undefined
    r 0  0  x  1 : ? : 0;
    r 1  1  x  1 : ? : 1;
    x 0  0  x  1 : 0 : 0;
    x 1  1  x  1 : 1 : 1;
  endtable
endprimitive

module B2I(Z1,Z2,A);
  input A;
  output Z1,Z2;
  not (Z1,A);
  buf (Z2,A);
endmodule

module B2IP(Z1,Z2,A);
  input A;
  output Z1,Z2;
  not (Z1,A);
  buf (Z2,A);
endmodule

module B3I(Z1,Z2,A);
  input A;
  output Z1,Z2;
  not (Z1,A);
  buf (Z2,A);
endmodule

module B3IP(Z1,Z2,A);
  input A;
  output Z1,Z2;
  not (Z1,A);
  buf (Z2,A);
endmodule

module BTS5(Z,A,E);
  input A,E;
  output Z;
  notif1 (Z,A,E);
endmodule

module LD1(D, G, Q, QN);
  output Q, QN;
  input D, G;
  p_latch #1 (Q,G,D);
  not (QN,Q);
endmodule

primitive p_latch(q,g,d);
  output q;
  reg q;
  input g,d;
  table
//  g d : present q : next q
    1 0 : ? : 0;
    1 1 : ? : 1;
    0 ? : ? : -;
    x 0 : 0 : 0;
    x 1 : 1 : 1;
  endtable
endprimitive

module IBUF1(Z,A);
  output Z;
  input A;
  buf (Z,A);
endmodule

module IBUF2(Z,A);
  output Z;
  input A;
  buf (Z,A);
endmodule

module IBUF3(Z,A);
  output Z;
  input A;
  buf (Z,A);
endmodule

module IBUF4(Z,A);
  output Z;
  input A;
  buf (Z,A);
endmodule

module IBUF5(Z,A);
  output Z;
  input A;
  buf (Z,A);
endmodule

module OBUF1(Z,A);
  output Z;
  input A;
  buf (Z,A);
endmodule

module OBUF2(Z,A);
  output Z;
  input A;
  buf (Z,A);
endmodule

module BIDI (Z,E,A);
  input A,E;
  output Z;
  bufif0 (Z,A,E);
endmodule
