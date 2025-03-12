// Seed: 1211313281
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
    id_13
);
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  localparam id_14 = 1;
  logic id_15;
  ;
  assign id_12 = id_5;
endmodule
macromodule module_1 #(
    parameter id_2 = 32'd42
) (
    id_1,
    _id_2
);
  inout wire _id_2;
  inout logic [7:0] id_1;
  assign id_1[id_2] = 1;
  wire id_3;
  localparam id_4 = 1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_3
  );
  assign id_3 = id_3;
  assign id_1 = id_2;
endmodule
