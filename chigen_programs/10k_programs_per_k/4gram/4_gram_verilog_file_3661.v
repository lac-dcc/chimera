// Seed: 4038390763
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
    id_14
);
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_15, id_16;
  assign id_1 = 1'b0 - id_3;
endmodule
module module_1 #(
    parameter id_7 = 32'd91
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_2,
      id_2,
      id_2,
      id_2,
      id_5,
      id_5,
      id_3,
      id_6,
      id_6,
      id_2,
      id_2,
      id_2
  );
  input wire id_3;
  inout wire id_2;
  input logic [7:0] id_1;
  logic _id_7;
  ;
  wand id_8 = 1;
  struct packed {logic [1 : -1] id_9;} [-1 : id_7] id_10;
  wire id_11;
  logic [1 : -1] id_12;
  ;
endmodule
