// Seed: 2133796764
module module_0 (
    id_1
);
  output wire id_1;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7#(
        .id_8 (1),
        .id_9 (1 & -1),
        .id_10(1),
        .id_11(1),
        .id_12(~1)
    ),
    id_13
);
  inout wire id_8;
  module_0 modCall_1 (id_8);
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  nor primCall (id_8, id_7, id_2, id_6, id_3, id_9, id_10, id_4, id_13, id_11);
endmodule
