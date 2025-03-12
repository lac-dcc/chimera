// Seed: 166593553
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_8 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4#(
        .id_5(-1),
        .id_6(1),
        .id_7(1)
    ),
    id_8,
    id_9
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  nand primCall (id_6, id_8, id_3, id_9, id_2);
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_2,
      id_9,
      id_6,
      id_6,
      id_6
  );
endmodule
