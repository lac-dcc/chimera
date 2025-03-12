// Seed: 1218191465
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    output tri id_2,
    input uwire id_3,
    input tri1 id_4,
    output tri0 id_5
);
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    input supply0 id_2,
    input tri1 id_3,
    input tri1 id_4,
    input wand id_5,
    output tri0 id_6
);
  wire id_8;
  assign id_0 = id_4;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_6,
      id_1,
      id_3,
      id_6
  );
endmodule
module module_2 #(
    parameter id_16 = 32'd6
) (
    input tri0 id_0,
    input wire id_1,
    input wire id_2,
    output wor id_3,
    input wire id_4,
    output tri1 id_5,
    output supply0 id_6,
    input wand id_7,
    input tri0 id_8,
    input tri1 id_9,
    input wor id_10,
    output tri0 id_11,
    output uwire id_12,
    input supply1 id_13,
    input tri id_14,
    input tri0 id_15
    , id_19,
    input tri _id_16,
    output wand id_17
);
  logic id_20[1  ==  !  id_16 : 1];
  ;
  xor primCall (
      id_3, id_8, id_20, id_10, id_7, id_1, id_14, id_9, id_4, id_15, id_0, id_19, id_13, id_2
  );
  module_0 modCall_1 (
      id_4,
      id_10,
      id_6,
      id_9,
      id_1,
      id_3
  );
  assign modCall_1.id_0 = 0;
endmodule
