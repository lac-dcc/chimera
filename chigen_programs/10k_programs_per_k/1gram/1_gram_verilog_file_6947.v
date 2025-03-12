// Seed: 1752263134
module module_0 (
    output tri1 id_0,
    input tri id_1,
    input wand id_2,
    input tri id_3,
    input supply1 id_4,
    input supply0 id_5,
    output supply1 id_6,
    input wand id_7,
    input wor id_8,
    output supply1 id_9
);
  wire id_11;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    output tri0 id_2,
    input supply0 id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_2,
      id_0,
      id_3,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 #(
    parameter id_5 = 32'd10
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output logic [7:0] id_1;
  logic _id_5;
  ;
  always id_1[id_5] <= 1;
endmodule
module module_3 #(
    parameter id_10 = 32'd37,
    parameter id_11 = 32'd53,
    parameter id_14 = 32'd8,
    parameter id_7  = 32'd22
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7[id_11 : id_7],
    id_8[id_14 : id_7*-1],
    id_9,
    _id_10,
    _id_11,
    id_12,
    id_13,
    _id_14,
    id_15,
    id_16[1'd0 : id_10]
);
  output logic [7:0] id_16;
  output wire id_15;
  input wire _id_14;
  output wire id_13;
  output wire id_12;
  input wire _id_11;
  input wire _id_10;
  output wire id_9;
  output logic [7:0] id_8;
  input logic [7:0] _id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  module_2 modCall_1 (
      id_8,
      id_3,
      id_3,
      id_4
  );
  input wire id_2;
  inout wire id_1;
  assign id_15.id_4 = id_4;
  wire id_17 = id_1 * -1'd0;
endmodule
