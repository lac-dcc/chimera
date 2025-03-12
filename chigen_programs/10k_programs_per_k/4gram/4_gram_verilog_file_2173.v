// Seed: 1742206358
module module_0 (
    output tri0 id_0,
    input wire id_1,
    input supply0 id_2,
    output wire id_3,
    input wand id_4,
    input tri0 id_5,
    input wor id_6,
    output supply0 id_7,
    input supply1 id_8,
    input tri1 id_9,
    input tri id_10,
    output wand id_11,
    input wor id_12,
    input tri1 id_13,
    input supply1 id_14,
    input uwire id_15,
    output wand id_16,
    input supply1 id_17,
    output wor id_18
);
  assign id_0  = {-1{id_17}};
  assign id_18 = (id_10 < 1'b0);
endmodule
module module_1 (
    input tri id_0,
    input uwire id_1,
    input supply0 id_2,
    input tri id_3,
    input supply0 id_4,
    output tri1 id_5,
    input supply0 id_6,
    output uwire id_7,
    output tri1 id_8,
    input supply0 id_9,
    input supply1 id_10,
    input supply1 id_11,
    output wor id_12,
    input tri0 id_13,
    input supply1 id_14,
    input supply1 id_15,
    output uwire id_16
);
  wire id_18, id_19;
  module_0 modCall_1 (
      id_16,
      id_10,
      id_6,
      id_5,
      id_1,
      id_3,
      id_4,
      id_16,
      id_2,
      id_3,
      id_14,
      id_8,
      id_13,
      id_6,
      id_4,
      id_10,
      id_16,
      id_11,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
