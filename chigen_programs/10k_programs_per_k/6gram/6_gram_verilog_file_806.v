// Seed: 1278253840
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    input supply0 id_2,
    output tri id_3,
    output supply1 id_4,
    output tri id_5
);
  supply1 id_7 = id_2;
endmodule
module module_1 (
    input uwire id_0,
    input wire id_1,
    output wand id_2,
    output wand id_3,
    output uwire id_4,
    input tri0 id_5,
    input wor id_6,
    input tri id_7,
    inout supply0 id_8,
    input wire id_9,
    input uwire id_10,
    input supply1 id_11,
    output supply1 id_12,
    input tri0 id_13,
    output wor id_14,
    inout supply1 id_15,
    input supply1 id_16,
    output supply0 id_17,
    input wire id_18,
    input tri id_19,
    output tri id_20
);
  assign id_3 = 1'b0 ? id_11 : id_10 ? 1 : id_19 - id_9;
  module_0 modCall_1 (
      id_0,
      id_15,
      id_7,
      id_8,
      id_3,
      id_3
  );
  assign modCall_1.type_4 = 0;
endmodule
