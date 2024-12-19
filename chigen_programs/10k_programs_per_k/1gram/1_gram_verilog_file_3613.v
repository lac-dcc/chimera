// Seed: 1832479179
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
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = 1;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1#(
        .id_2(1'b0),
        .id_3(id_4),
        .id_5(1'b0),
        .product(1),
        .id_6(1'b0),
        .id_7(1),
        .id_8(1'b0)
    ),
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_7 = 1;
  module_0 modCall_1 (
      id_12,
      id_7,
      id_10,
      id_9,
      id_7,
      id_10,
      id_11,
      id_9
  );
endmodule
