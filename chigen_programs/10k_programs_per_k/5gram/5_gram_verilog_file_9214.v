// Seed: 448972613
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = id_3 ~^ id_3;
  logic id_7;
  assign id_4 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd10
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
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
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire _id_5;
  inout wire id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_12,
      id_3,
      id_9,
      id_3
  );
  output tri0 id_2;
  output logic [7:0] id_1;
  assign id_1[1==id_5] = id_6;
  assign id_2 = id_5 ? 1 == id_5 >= -1'b0 : -1;
endmodule
