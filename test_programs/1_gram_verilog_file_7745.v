// Seed: 617249932
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    input wor id_2,
    output supply0 id_3,
    output uwire id_4,
    input supply0 id_5,
    input tri id_6,
    input supply1 id_7,
    input wor id_8,
    output wire id_9,
    input uwire id_10,
    input supply0 id_11,
    input wire id_12,
    output wand id_13,
    output supply0 id_14,
    input tri0 id_15,
    input uwire id_16,
    input tri id_17,
    output wand id_18,
    output tri id_19,
    input supply1 id_20
);
endmodule
module module_1 (
    output supply0 id_0,
    input supply0 id_1,
    input wand id_2,
    input uwire id_3,
    output supply0 id_4,
    input tri id_5,
    output supply1 id_6,
    input supply0 id_7,
    output tri0 id_8
);
  always $display(-1, id_2, 1 | id_7, 1 - -1, id_2, 1, id_3, -1 & id_1);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_8,
      id_4,
      id_3,
      id_5,
      id_1,
      id_3,
      id_0,
      id_1,
      id_5,
      id_5,
      id_6,
      id_8,
      id_1,
      id_2,
      id_7,
      id_8,
      id_6,
      id_2
  );
  assign modCall_1.type_28 = 0;
  wire id_10, id_11;
  wire id_12;
  assign id_8 = 1;
  logic [7:0][1]
      id_13 (
          .id_0(-1),
          .id_1(id_7),
          .id_2(id_12)
      ),
      id_14;
  id_15(
      -1, 1'b0, id_4
  );
endmodule
