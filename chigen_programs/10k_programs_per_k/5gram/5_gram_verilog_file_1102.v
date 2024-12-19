// Seed: 1692424552
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input wire id_2,
    output supply1 id_3
    , id_13,
    output supply0 id_4,
    output supply1 id_5
    , id_14,
    output tri0 id_6,
    input tri0 id_7,
    output wor id_8,
    output wand id_9
    , id_15,
    input supply0 id_10,
    output wand id_11
);
  assign id_8 = id_14;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    inout  uwire   id_1
);
  assign id_1 = 1'd0 & id_1 ? id_1 : id_1;
  not primCall (id_0, id_1);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0
  );
endmodule
