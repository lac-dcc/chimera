// Seed: 1468388238
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_8;
  supply0 id_9 = 1;
  assign module_1.id_11 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd64,
    parameter id_2  = 32'd67,
    parameter id_3  = 32'd97
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10
);
  inout wire _id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire _id_3;
  nand primCall (id_9, id_12, id_4, id_1, id_13, id_14, id_11, id_16, id_15);
  input wire _id_2;
  input wire id_1;
  reg [id_3 : id_2  &&  id_10] id_11, id_12, id_13, id_14, id_15;
  assign id_9 = id_3;
  wire id_16;
  module_0 modCall_1 (
      id_16,
      id_5,
      id_16,
      id_16,
      id_8,
      id_4,
      id_7
  );
  parameter id_17 = 1;
  wire id_18;
  assign id_15 = -1;
  always id_14 <= 1'b0;
endmodule
