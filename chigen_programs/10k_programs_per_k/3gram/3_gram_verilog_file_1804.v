// Seed: 3574067443
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
    id_15
);
  output wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  inout tri id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_8 = 1'b0;
endmodule
module module_1 #(
    parameter id_2 = 32'd38
) (
    id_1,
    _id_2,
    id_3,
    id_4
);
  input logic [7:0] id_4;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_1,
      id_3
  );
  inout wire id_3;
  input wire _id_2;
  inout wire id_1;
  assign id_3 = id_4[id_2];
endmodule
