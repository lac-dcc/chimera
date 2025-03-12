// Seed: 1673012488
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd87
) (
    id_1,
    _id_2
);
  inout wire _id_2;
  input wire id_1;
  wire [-1 : id_2] id_3;
  wire [-1 : id_2] id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3
  );
  logic id_5 = 1;
endmodule
module module_2 #(
    parameter id_6 = 32'd69
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire _id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_10,
      id_3,
      id_3,
      id_3
  );
  assign id_2[1 : id_6] = 1;
endmodule
