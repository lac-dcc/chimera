// Seed: 1438758898
module module_0 (
    input supply1 id_0,
    output wor id_1,
    output tri id_2,
    output wire id_3,
    input tri1 id_4,
    output tri0 id_5,
    input wand id_6,
    input supply0 id_7,
    input supply1 id_8,
    output uwire id_9
);
  wire id_11, id_12;
  nand primCall (id_3, id_0, id_6, id_4, id_12, id_7, id_8);
  module_2 modCall_1 (
      id_8,
      id_3,
      id_9,
      id_8,
      id_6,
      id_7,
      id_5,
      id_7,
      id_6,
      id_0,
      id_0,
      id_6,
      id_6,
      id_3,
      id_0,
      id_5,
      id_5,
      id_5,
      id_8,
      id_3
  );
  assign modCall_1.id_7 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    output tri id_2,
    input wand id_3
);
  assign id_2 = ~id_0 == id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_2,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.type_2 = 0;
endmodule
module module_2 (
    input tri0 id_0,
    output tri1 id_1,
    output supply1 id_2
    , id_21,
    input supply0 id_3,
    input wand id_4,
    input tri1 id_5,
    output supply1 id_6,
    input tri id_7,
    input supply0 id_8,
    input tri0 id_9,
    input wire id_10,
    input wor id_11,
    input wire id_12,
    output wand id_13,
    input tri0 id_14,
    output tri1 id_15,
    output tri1 id_16,
    output supply1 id_17,
    input wand id_18,
    output uwire id_19
);
  wire id_22;
  wire id_23;
  id_24(
      .id_0(1), .id_1(id_7), .id_2(1'b0), .id_3(1), .id_4(id_10)
  );
endmodule
