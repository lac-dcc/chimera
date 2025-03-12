// Seed: 1436004610
module module_0 (
    input wor id_0,
    output tri1 id_1,
    output tri id_2,
    input tri id_3,
    output supply1 id_4,
    input supply0 id_5,
    output supply1 id_6,
    input wand id_7
);
  wire id_9;
  ;
endmodule
module module_1 (
    output tri id_0,
    input supply0 id_1,
    output wor id_2,
    input uwire id_3
);
  logic id_5;
  ;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_0,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.id_6 = 0;
  logic [-1 : 1] id_6;
endmodule
module module_2 (
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
    id_22
);
  input wire id_22;
  input wire id_21;
  input wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_23;
  always_comb @(1 or posedge id_19) $unsigned(39);
  ;
endmodule
module module_3 (
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
    id_11
);
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input logic [7:0] id_8;
  inout wire id_7;
  output logic [7:0] id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_6[1'b0==1] = id_8[-1 : 1==-1];
  wire id_12;
  wire id_13;
  module_2 modCall_1 (
      id_12,
      id_5,
      id_5,
      id_5,
      id_12,
      id_13,
      id_7,
      id_13,
      id_11,
      id_5,
      id_5,
      id_1,
      id_1,
      id_5,
      id_5,
      id_13,
      id_7,
      id_9,
      id_7,
      id_7,
      id_9,
      id_12
  );
  assign id_11 = id_7;
endmodule
