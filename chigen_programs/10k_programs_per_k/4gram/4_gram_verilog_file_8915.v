// Seed: 1451531487
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input tri id_2,
    output wor id_3,
    output wor id_4,
    input uwire id_5,
    input uwire id_6,
    input uwire id_7,
    output wand id_8,
    input wire id_9,
    input wor id_10,
    input supply0 id_11,
    input supply1 id_12,
    input wand id_13,
    input supply1 id_14
);
endmodule
module module_1 #(
    parameter id_0 = 32'd91
) (
    input supply1 _id_0,
    output supply1 id_1,
    input supply0 id_2,
    output wire id_3,
    input supply0 id_4,
    input uwire id_5,
    input uwire id_6
);
  logic   [id_0 : 1] id_8 = -1;
  integer [1 : id_0] id_9 = 1;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_1,
      id_1,
      id_5,
      id_6,
      id_6,
      id_1,
      id_4,
      id_4,
      id_6,
      id_6,
      id_4,
      id_4
  );
  assign modCall_1.id_4 = 0;
  assign id_1 = id_0 ? id_0 : (id_8);
endmodule
