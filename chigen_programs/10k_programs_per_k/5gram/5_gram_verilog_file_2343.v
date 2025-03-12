// Seed: 690038499
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
    id_13
);
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  wire id_14;
endmodule
module module_1 #(
    parameter id_4 = 32'd25
) (
    input supply1 id_0,
    input uwire id_1,
    output wire id_2,
    input tri id_3,
    output supply0 _id_4
);
  wire id_6;
  logic [7:0][1 : id_4] id_7;
  assign id_7[1] = id_6;
  parameter id_8 = 1;
  assign id_2 = id_3 ? id_1 : -1;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_8,
      id_6,
      id_8,
      id_8,
      id_8,
      id_6,
      id_8,
      id_6,
      id_8,
      id_6,
      id_8
  );
  wire id_9;
endmodule
