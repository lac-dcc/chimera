// Seed: 2159910436
module module_0 (
    output wand id_0,
    input wor id_1,
    input supply1 id_2
    , id_19#(
        .id_20(1),
        .id_21(-1),
        .id_22(1)
    ),
    input tri0 id_3,
    output wor id_4,
    input wor id_5,
    input uwire id_6,
    input supply1 id_7,
    output tri1 id_8,
    input wor id_9,
    input tri0 id_10,
    input uwire id_11,
    input tri id_12,
    output wor id_13,
    input supply1 id_14,
    output wor id_15,
    output tri0 id_16
    , id_23,
    output wire id_17
);
  wire id_24 = id_19;
  pullup (1);
  assign id_24 = id_6 - id_2;
endmodule
module module_1 (
    output tri1 id_0,
    input tri0 id_1,
    input wor id_2,
    input wand id_3,
    input tri0 id_4,
    input tri0 id_5,
    output tri0 id_6,
    input wor id_7,
    input uwire id_8,
    input wand id_9,
    input tri1 id_10,
    input wire id_11,
    input supply0 id_12,
    input tri0 id_13,
    input supply1 id_14,
    input uwire id_15,
    output tri1 id_16,
    input tri id_17
);
  always if (1 - 1) @(posedge {1{id_5}} or posedge id_9);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_17,
      id_2,
      id_0,
      id_13,
      id_4,
      id_10,
      id_6,
      id_17,
      id_5,
      id_15,
      id_15,
      id_6,
      id_10,
      id_0,
      id_16,
      id_0
  );
  assign modCall_1.id_24 = 0;
endmodule
