// Seed: 2100052109
module module_0 ();
  wire id_1;
  ;
endmodule
module module_1 (
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
    id_15
);
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout logic [7:0] id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output reg id_6;
  nand primCall (
      id_1, id_10, id_11, id_12, id_13, id_14, id_15, id_2, id_3, id_4, id_5, id_7, id_9
  );
  module_0 modCall_1 ();
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_11[1][-1] = id_9;
  wire [1 : 1 'b0] id_16;
  always id_6 <= #1 id_11;
endmodule
