// Seed: 552437962
module module_0 (
    output wand id_0,
    input tri0 id_1#(
        .id_19(-1),
        .id_20(id_12 - id_17),
        .id_21(-1'b0),
        .id_22(1)
    ),
    input tri0 id_2,
    input tri0 id_3,
    input wor id_4,
    output tri0 id_5,
    input wire id_6,
    output wor id_7,
    input wor id_8,
    input supply0 id_9,
    input wor id_10,
    input wor id_11,
    input supply0 id_12,
    input tri1 id_13,
    output supply1 id_14,
    input tri0 id_15,
    id_23,
    input wand id_16,
    input uwire id_17
);
  wire id_24;
  wire id_25;
  assign id_14 = id_16;
  wire id_26;
  wire id_27;
  assign id_25 = -1;
endmodule
module module_1 (
    output wand id_0,
    input  tri  id_1,
    output tri0 id_2,
    input  wand id_3
);
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_3,
      id_1,
      id_1,
      id_2,
      id_3,
      id_0,
      id_3,
      id_1,
      id_3,
      id_1,
      id_1,
      id_3,
      id_0,
      id_1,
      id_1,
      id_3
  );
  assign modCall_1.type_32 = 0;
  assign id_2 = -1;
  wire id_7, id_8, id_9;
  nand primCall (id_2, id_6, id_1);
endmodule
