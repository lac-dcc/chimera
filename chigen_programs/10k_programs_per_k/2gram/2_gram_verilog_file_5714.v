// Seed: 1034538556
module module_0 (
    input  uwire id_0
    , id_9,
    input  wor   id_1,
    input  wor   id_2,
    output uwire id_3,
    output tri   id_4,
    output wand  id_5,
    output wire  id_6,
    output wor   id_7
);
  assign id_7 = id_1;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input wand id_2,
    input tri id_3,
    output wor id_4
);
  assign id_4 = 1 & id_2;
  genvar id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_6,
      id_6,
      id_6,
      id_4,
      id_4
  );
  assign modCall_1.id_6 = 0;
  assign id_4 = id_6;
  supply1 id_7;
  assign id_4 = id_6;
  assign id_6 = id_7++;
endmodule
