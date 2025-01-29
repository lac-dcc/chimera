// Seed: 2518982895
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    input uwire id_2,
    input wire id_3,
    input uwire id_4,
    output tri0 id_5,
    id_18,
    input supply1 id_6,
    input wire id_7,
    output wor id_8,
    output tri1 id_9,
    input uwire id_10,
    input tri id_11,
    input wire id_12,
    input tri id_13,
    output supply1 id_14,
    input wand id_15,
    output wor id_16,
    id_19
);
  generate
    begin : LABEL_0
      wire id_20, id_21;
    end
    assign id_9 = id_7;
  endgenerate
endmodule
module module_1 (
    input supply0 id_0,
    output tri id_1,
    input tri1 id_2,
    input supply0 id_3,
    output tri0 id_4,
    input wire id_5,
    input uwire id_6,
    input tri id_7,
    input wor id_8,
    output wire id_9,
    input tri id_10,
    input tri1 id_11,
    input tri1 id_12,
    input wand id_13,
    input tri id_14,
    input wand id_15,
    input uwire id_16,
    input uwire id_17,
    input uwire id_18,
    input supply1 id_19,
    input tri1 id_20,
    output supply0 id_21,
    output tri0 id_22
);
  id_24(
      -1, 1 - id_3
  );
  or primCall (id_22, id_19, id_15, id_8, id_3, id_16, id_2, id_5, id_0, id_11, id_6, id_20, id_24);
  module_0 modCall_1 (
      id_22,
      id_18,
      id_13,
      id_13,
      id_16,
      id_9,
      id_18,
      id_20,
      id_22,
      id_9,
      id_2,
      id_12,
      id_8,
      id_19,
      id_1,
      id_18,
      id_22
  );
  assign modCall_1.id_15 = 0;
endmodule
