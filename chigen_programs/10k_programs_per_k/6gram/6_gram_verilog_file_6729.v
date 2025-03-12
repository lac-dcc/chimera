// Seed: 1637540206
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
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  assign module_1.id_6 = 0;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  tri id_13 = 1;
endmodule
module module_1 #(
    parameter id_10 = 32'd69,
    parameter id_6  = 32'd46,
    parameter id_9  = 32'd44
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    _id_9
);
  inout wire _id_9;
  output wire id_8;
  input wire id_7;
  inout wire _id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  integer _id_10[1 'b0 : 1];
  supply0 [id_6  -  id_9 : id_9] id_11 = 1 & -1;
  assign id_5 = (id_2) == id_1;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_11,
      id_11,
      id_11,
      id_4,
      id_11,
      id_7,
      id_7,
      id_3,
      id_11,
      id_11
  );
  assign id_6 = id_1;
  wire id_12;
  supply0 id_13 = id_1[id_10 : 1] && id_11 == id_6;
  logic id_14;
endmodule
