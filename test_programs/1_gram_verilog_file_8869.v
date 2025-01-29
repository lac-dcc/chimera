// Seed: 3805305205
module module_0 (
    output wor id_0,
    input supply0 id_1,
    output uwire id_2,
    output supply1 id_3,
    input uwire id_4,
    input wand id_5#(
        .id_9 (id_9),
        .id_10(id_9),
        .id_11(1'b0),
        .id_12(-1 - id_1),
        .id_13(1 - 1),
        .id_14(1'b0),
        .id_15(1),
        .id_16(-1'h0),
        .id_17(-1'b0)
    ),
    input wor id_6,
    output wire id_7
);
  wire id_18;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output logic id_1,
    output tri0  id_2,
    input  wor   id_3,
    input  tri1  id_4,
    output tri   id_5,
    input  logic id_6,
    output uwire id_7,
    input  tri   id_8
);
  always id_1 <= (id_6);
  nor primCall (id_1, id_6, id_0, id_8, id_3, id_4);
  module_0 modCall_1 (
      id_7,
      id_8,
      id_5,
      id_2,
      id_3,
      id_3,
      id_0,
      id_2
  );
endmodule
