// Seed: 2375342987
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
    id_12
);
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output tri0 id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign #id_13 id_6 = -1;
endmodule
module module_1 #(
    parameter id_3 = 32'd42
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire _id_3;
  inout wire id_2;
  inout wire id_1;
  wire [1 : id_3] id_11;
  logic [7:0] id_12;
  ;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_10,
      id_9,
      id_9,
      id_10,
      id_11,
      id_8,
      id_2,
      id_11,
      id_11,
      id_8
  );
  assign modCall_1.id_13 = 0;
  wire id_13 = id_12;
  localparam id_14 = 1;
  assign id_12[1'h0] = -1;
endmodule
