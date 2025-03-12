// Seed: 1129373259
module module_0 (
    input wor id_0,
    input wor id_1
    , id_15,
    input uwire id_2,
    output uwire id_3,
    output uwire id_4,
    input supply0 id_5,
    input tri id_6,
    output tri id_7,
    input uwire id_8,
    output uwire id_9,
    input tri id_10,
    input wand id_11,
    output wire id_12,
    output wor id_13
);
  wire id_16;
  assign id_4 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    output supply1 id_1,
    input wire id_2,
    input supply0 id_3,
    input wor id_4[-1 : 1 'b0],
    output wire id_5,
    output supply1 id_6,
    output wor id_7,
    output supply0 id_8,
    input uwire id_9,
    input uwire id_10,
    input tri id_11
);
  wire id_13[1 'b0 : -1];
  module_0 modCall_1 (
      id_11,
      id_11,
      id_3,
      id_5,
      id_8,
      id_9,
      id_9,
      id_6,
      id_10,
      id_8,
      id_2,
      id_10,
      id_6,
      id_8
  );
  assign modCall_1.id_9 = 0;
endmodule
