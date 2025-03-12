// Seed: 1878816449
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd65,
    parameter id_3 = 32'd86,
    parameter id_5 = 32'd2,
    parameter id_7 = 32'd25
) (
    id_1,
    _id_2[-1||id_3 : 1],
    _id_3,
    id_4[-1'b0&id_5 : ""],
    _id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire _id_7;
  output wire id_6;
  input wire _id_5;
  input logic [7:0] id_4;
  module_0 modCall_1 (
      id_11,
      id_6,
      id_6,
      id_1,
      id_12,
      id_8,
      id_12
  );
  output wire _id_3;
  input logic [7:0] _id_2;
  output wire id_1;
  wire [id_2 : id_7] id_13;
  xor primCall (id_6, id_10, id_8, id_12, id_4);
  assign id_9 = id_10;
  assign id_3#(.id_5(1)) = id_13;
  wire id_14;
endmodule
