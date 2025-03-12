// Seed: 2590998610
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_8;
  ;
endmodule
module module_1 #(
    parameter id_13 = 32'd40
) (
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
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_7,
      id_7,
      id_10,
      id_8
  );
  inout logic [7:0] id_1;
  logic id_12 = id_3;
  wire  _id_13;
  assign id_1[-1-id_13] = id_10 ? id_10 : id_4 * 1'b0;
endmodule
