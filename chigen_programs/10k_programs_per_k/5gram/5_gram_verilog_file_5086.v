// Seed: 3094996314
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
    id_21
);
  output wire id_21;
  input wire id_20;
  input wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input logic [7:0] id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  tri1 id_22;
  assign id_22 = 1 & id_4;
  wire id_23;
  ;
  wire id_24;
endmodule
module module_1 #(
    parameter id_4 = 32'd73
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  input wire id_6;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3,
      id_2,
      id_5,
      id_3,
      id_1,
      id_6,
      id_1,
      id_3,
      id_3,
      id_3,
      id_5,
      id_1,
      id_1,
      id_1,
      id_1,
      id_5,
      id_1,
      id_1,
      id_1
  );
  output wire id_5;
  inout wire _id_4;
  inout tri1 id_3;
  inout logic [7:0] id_2;
  inout wire id_1;
  assign id_3 = 1'b0;
  assign id_2[id_4] = ~(id_4) | 1 | -1'd0;
  tri0 id_7 = 1;
endmodule
