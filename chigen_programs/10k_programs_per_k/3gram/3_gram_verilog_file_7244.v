// Seed: 443175345
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    input wor id_2,
    input tri1 id_3,
    output wor id_4,
    input tri0 id_5,
    output uwire id_6,
    input tri id_7
    , id_11,
    input wor id_8,
    input wand id_9
);
  wire id_12;
  ;
endmodule
module module_1 (
    input tri0 id_0,
    output wor id_1,
    input supply1 id_2,
    input uwire id_3,
    input wand id_4,
    output tri1 id_5,
    input supply0 id_6,
    input wire id_7,
    input wor id_8
);
  assign id_1 = id_6;
  assign id_1 = id_4;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_4,
      id_8,
      id_5,
      id_3,
      id_5,
      id_6,
      id_3,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
