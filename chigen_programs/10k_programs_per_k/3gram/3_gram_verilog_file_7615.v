// Seed: 43408520
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30
);
  inout wire id_30;
  input wire id_29;
  inout wire id_28;
  input wire id_27;
  input wire id_26;
  inout wire id_25;
  input wire id_24;
  inout wire id_23;
  output wire id_22;
  inout wire id_21;
  input wire id_20;
  input wire id_19;
  input wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = !1'b0;
  assign module_1.type_29 = 0;
endmodule
module module_1 (
    input wire id_0
    , id_15,
    inout wor id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply0 id_4,
    input wor id_5,
    input tri0 id_6,
    output logic id_7,
    input uwire id_8,
    output wand id_9,
    input tri1 id_10,
    input supply0 id_11,
    input tri0 id_12,
    output wire id_13
);
  wire id_16 = 1;
  supply1 id_17 = 1;
  wire id_18;
  always_latch @(posedge 1) id_7 <= #1 "";
  wire id_19;
  assign  id_17  =  1  ?  1  :  {  1 'b0 ,  id_4  ,  id_17  ,  id_2  ,  1  ,  1  ,  1  &  id_12  ,  1  ,  id_4  ,  1  ,  id_15  }  ?  id_15  :  1  ?  1  :  1  ?  1  :  1 'h0 ;
  wire id_20, id_21, id_22, id_23, id_24, id_25, id_26, id_27, id_28;
  module_0 modCall_1 (
      id_23,
      id_26,
      id_17,
      id_19,
      id_16,
      id_22,
      id_19,
      id_21,
      id_28,
      id_27,
      id_17,
      id_24,
      id_20,
      id_26,
      id_20,
      id_18,
      id_28,
      id_21,
      id_20,
      id_20,
      id_23,
      id_27,
      id_21,
      id_23,
      id_17,
      id_16,
      id_18,
      id_22,
      id_22,
      id_26
  );
  assign id_13 = 1;
endmodule
