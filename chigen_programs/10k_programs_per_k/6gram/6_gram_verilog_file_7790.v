// Seed: 3306969384
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
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  parameter id_9 = 1;
  logic id_10, id_11;
  logic id_12 = id_8 - 1;
endmodule
module module_1 #(
    parameter id_7 = 32'd89
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  nor primCall (id_10, id_6, id_1, id_2, id_4, id_8, id_5);
  inout wire _id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_1,
      id_10,
      id_10,
      id_9,
      id_5,
      id_5,
      id_6,
      id_6
  );
  assign id_8 = id_6;
  assign id_2[id_7 : id_7] = id_1;
endmodule
