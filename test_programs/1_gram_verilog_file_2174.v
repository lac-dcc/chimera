// Seed: 1906872234
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input wand id_2,
    output supply0 id_3,
    output wire id_4,
    input wire id_5,
    input tri0 id_6,
    id_15,
    output wand id_7,
    output wand id_8,
    input wor id_9,
    input wire id_10,
    output wor id_11,
    output wor id_12,
    output tri0 id_13
);
  bit id_16, id_17;
  tri id_18 = -1 - 1, id_19 = id_15, id_20, id_21, id_22, id_23;
  initial id_16 <= ~-1'h0;
  `define pp_24 0
  assign id_12 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    output wor id_1,
    input uwire id_2,
    output tri id_3,
    input tri id_4,
    input wor id_5,
    output tri0 id_6,
    input tri id_7,
    output logic id_8,
    id_19,
    input tri1 id_9,
    output uwire id_10,
    input wor id_11,
    output supply1 id_12,
    input tri1 id_13,
    input tri1 id_14,
    output uwire id_15,
    output tri0 id_16,
    input tri id_17
);
  tri1 id_20;
  assign id_8 = -1;
  initial id_8 <= (-1);
  assign id_1 = {id_19 & 1, id_9, id_20, id_5, 1'b0, 1 >> id_5} ? id_20 : -1;
  nand primCall (id_12, id_11, id_14, id_17, id_7, id_9, id_4, id_2, id_13, id_0, id_5, id_20);
  module_0 modCall_1 (
      id_20,
      id_11,
      id_20,
      id_1,
      id_6,
      id_20,
      id_13,
      id_12,
      id_20,
      id_9,
      id_14,
      id_16,
      id_10,
      id_12
  );
  assign modCall_1.type_2 = 0;
endmodule
