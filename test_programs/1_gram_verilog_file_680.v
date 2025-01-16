// Seed: 1535299784
module module_0 (
    input  tri0  id_0,
    input  tri   id_1,
    input  tri   id_2,
    output tri0  id_3,
    input  uwire id_4,
    input  wor   id_5,
    input  uwire id_6,
    input  wor   id_7,
    input  tri   id_8,
    input  wand  id_9,
    input  tri0  id_10,
    input  tri   id_11,
    input  wor   id_12
);
  supply1 id_14;
  for (id_15 = 1'd0; ~id_7; id_14 = id_15) assign id_14 = id_1;
  assign id_3 = id_2;
  wire id_16, id_17, id_18, id_19, id_20;
  assign module_1.id_20 = 0;
  id_21(
      1
  );
endmodule
module module_1 (
    output tri1 id_0,
    input tri id_1,
    input wand id_2,
    output wor id_3,
    input uwire id_4,
    output tri1 id_5,
    output uwire id_6,
    output uwire id_7,
    output supply0 id_8,
    id_25,
    input wand id_9,
    input tri0 id_10,
    input tri0 id_11,
    id_26,
    input uwire id_12,
    input tri id_13,
    input supply0 id_14,
    input uwire id_15,
    input wor id_16,
    output tri1 id_17,
    output tri1 id_18,
    input supply0 id_19,
    input wor id_20,
    input wire id_21,
    input supply0 id_22,
    input wand id_23
);
  assign id_17 = id_13;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_4,
      id_5,
      id_1,
      id_2,
      id_20,
      id_16,
      id_15,
      id_22,
      id_10,
      id_14,
      id_19
  );
  id_27(
      id_20 + id_22
  );
endmodule
