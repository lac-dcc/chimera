// Seed: 3732223714
module module_0 (
    output wand id_0,
    output tri1 id_1,
    input uwire id_2,
    output tri0 id_3,
    input tri0 id_4,
    input tri0 id_5,
    output uwire id_6,
    input supply1 id_7,
    input tri0 id_8,
    output tri0 id_9,
    input tri1 id_10,
    output uwire id_11#(
        .id_21(1),
        .id_22(1),
        .id_23(1),
        .id_24(-1'b0)
    ),
    input wire id_12,
    input tri0 id_13,
    input supply1 id_14,
    output supply0 id_15,
    output tri id_16,
    input supply1 id_17,
    output supply1 id_18,
    input tri0 id_19
);
  wire id_25;
endmodule
module module_1 (
    input  wand id_0,
    output tri1 id_1,
    input  wand id_2
);
  assign id_1 = 1;
  logic id_4;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1,
      id_2,
      id_0,
      id_1,
      id_0,
      id_2,
      id_1,
      id_0,
      id_1,
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_2,
      id_1,
      id_0
  );
  assign modCall_1.id_6 = 0;
  logic id_5 = id_5 & 1;
endmodule
