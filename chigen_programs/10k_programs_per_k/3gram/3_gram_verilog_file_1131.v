// Seed: 3448999433
module module_0 (
    output uwire id_0,
    input tri1 id_1,
    output tri1 id_2,
    output tri id_3,
    input uwire id_4,
    input tri id_5,
    output supply1 id_6,
    output wor id_7,
    output supply0 id_8,
    input wand id_9
);
  assign id_8 = id_1 * 1;
  integer id_11;
  uwire   id_12 = -1, id_13 = 1;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd74,
    parameter id_5 = 32'd35
) (
    inout wire id_0,
    output wire id_1,
    output wor id_2,
    input tri1 _id_3,
    input supply0 id_4,
    input uwire _id_5,
    output uwire id_6,
    output supply1 id_7
);
  wire [id_5 : id_3] id_9;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_7,
      id_2,
      id_4,
      id_0,
      id_1,
      id_1,
      id_2,
      id_4
  );
  assign id_1 = id_3;
endmodule
