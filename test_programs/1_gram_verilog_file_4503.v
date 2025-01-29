// Seed: 2877166807
module module_0 (
    input wand id_0,
    output tri0 id_1,
    input uwire id_2,
    output tri0 id_3,
    input wire id_4,
    input supply0 id_5,
    input uwire id_6,
    output wand id_7,
    output tri id_8,
    input tri0 id_9,
    output wor id_10,
    output tri0 id_11,
    input uwire id_12,
    input tri1 id_13,
    input supply0 id_14,
    output wire id_15,
    input wand id_16,
    input supply0 id_17,
    input supply0 id_18
);
  assign id_15 = id_12;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    output supply1 id_2,
    input wand id_3,
    input tri1 id_4#(
        .id_17(1 > ""),
        .id_18(1'h0),
        .id_19(1)
    ),
    input tri1 id_5,
    output uwire id_6,
    input tri id_7,
    input wor id_8,
    output wand id_9,
    output tri0 id_10,
    output tri id_11,
    output tri0 id_12,
    input tri1 id_13,
    output supply0 id_14,
    input uwire id_15
);
  assign id_14 = id_1;
  module_0 modCall_1 (
      id_4,
      id_10,
      id_1,
      id_9,
      id_1,
      id_3,
      id_4,
      id_9,
      id_2,
      id_3,
      id_14,
      id_9,
      id_13,
      id_7,
      id_4,
      id_10,
      id_4,
      id_7,
      id_4
  );
  assign modCall_1.type_3 = 0;
  assign id_9 = -1 ? -1 : id_1;
  assign id_10 = id_1;
endmodule
