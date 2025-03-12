// Seed: 1129929442
module module_0 (
    output wor id_0,
    output uwire id_1,
    output wor id_2,
    input tri id_3,
    input tri id_4,
    input supply0 id_5,
    input uwire id_6,
    output wand id_7,
    output uwire id_8
    , id_14,
    input uwire id_9,
    output tri id_10,
    output supply1 id_11,
    input tri id_12
);
  wire id_15;
  logic [(  1  ) : 1] id_16;
  ;
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    input wand id_2
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_1,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_4 = 0;
  wire id_4;
endmodule
