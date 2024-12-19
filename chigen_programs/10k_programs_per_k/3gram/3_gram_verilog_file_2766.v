// Seed: 2740541403
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input wand id_2,
    input wor id_3,
    input supply1 id_4,
    input supply0 id_5,
    output tri0 id_6
    , id_14,
    output supply1 id_7
    , id_15,
    inout tri1 id_8,
    output supply0 id_9,
    input wire id_10,
    output tri0 id_11
    , id_16,
    input tri1 id_12
);
  assign id_14 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    output wor id_1,
    output tri id_2,
    output supply1 id_3,
    input supply0 id_4,
    output wor id_5
);
  wire id_7 = 1;
  assign id_2 = 1 ? id_0 : {id_4{id_0}} & id_4;
  wire id_8;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_4,
      id_0,
      id_7,
      id_4,
      id_5,
      id_7,
      id_7,
      id_3,
      id_0,
      id_5,
      id_7
  );
  assign id_1 = id_7;
endmodule
