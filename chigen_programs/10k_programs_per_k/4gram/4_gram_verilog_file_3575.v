// Seed: 1254380528
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_2;
endmodule
module module_1 #(
    parameter id_6 = 32'd61,
    parameter id_7 = 32'd54
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_9,
      id_4,
      id_1,
      id_5,
      id_11
  );
  inout wire _id_7;
  input wire _id_6;
  output wire id_5;
  output wire id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  input wire id_1;
  xor primCall (id_11, id_3, id_9, id_1, id_2);
  logic [id_6 : id_7] id_13;
  ;
  assign id_3[-1] = id_1;
  parameter id_14 = -1'b0;
endmodule
