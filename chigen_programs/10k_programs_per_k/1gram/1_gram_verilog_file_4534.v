// Seed: 274216280
module module_0 (
    input tri id_0,
    output tri1 id_1,
    input uwire id_2,
    output wire id_3,
    output wand id_4#(
        .id_11(!1),
        .id_12(-1),
        .id_13(1),
        .id_14(1'h0),
        .id_15(~1),
        .id_16(1),
        .id_17(1),
        .id_18(1),
        .id_19(1),
        .id_20(1),
        .id_21(1)
    ),
    input uwire id_5,
    input wand id_6,
    output wand id_7,
    input supply1 id_8,
    output supply0 id_9
);
  wire id_22;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  uwire   id_0,
    output supply0 id_1,
    input  uwire   id_2
);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_1,
      id_2,
      id_1
  );
  logic id_4, id_5;
  not primCall (id_1, id_0);
endmodule
