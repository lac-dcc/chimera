// Seed: 4276195852
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  assign module_1.id_3 = 0;
  output wire id_2;
  output wire id_1;
  logic [-1 'b0 : 1] id_4 = id_3;
endmodule
module module_1 #(
    parameter id_10 = 32'd21,
    parameter id_16 = 32'd19,
    parameter id_3  = 32'd84
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
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    _id_16,
    id_17
);
  inout wire id_17;
  input wire _id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout logic [7:0] id_11;
  inout wire _id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  nand primCall (id_6, id_14, id_1, id_11, id_13, id_15, id_2, id_9, id_17);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_14
  );
  input wire _id_3;
  inout wire id_2;
  inout wire id_1;
  logic [id_10 : id_3] id_18;
  assign id_11[id_16<1] = (-1);
  assign id_4 = (id_15);
endmodule
