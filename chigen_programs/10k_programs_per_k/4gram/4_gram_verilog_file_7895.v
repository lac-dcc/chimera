// Seed: 1718297298
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
    id_16
);
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_14 = -1'b0;
  wire id_17;
endmodule
module module_1 #(
    parameter id_2 = 32'd91,
    parameter id_3 = 32'd53
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire _id_3;
  input wire _id_2;
  inout wire id_1;
  logic [id_3 : id_2] id_6, id_7;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_1,
      id_1,
      id_4,
      id_1,
      id_1,
      id_4,
      id_5,
      id_5,
      id_4,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign id_5 = id_6[1];
endmodule
