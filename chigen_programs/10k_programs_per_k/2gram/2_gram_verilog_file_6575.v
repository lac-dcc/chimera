// Seed: 2731129303
module module_0 (
    input  tri1  id_0,
    output uwire id_1,
    input  tri1  id_2,
    input  tri   id_3,
    input  uwire id_4
);
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input supply0 id_0
    , id_9,
    output tri0 id_1,
    output supply0 id_2,
    output wor id_3,
    output tri1 id_4,
    output supply0 id_5,
    input tri1 id_6,
    input tri1 id_7
);
  assign id_5 = id_0;
  nand primCall (id_5, id_9, id_6, id_0, id_7);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_6
  );
endmodule
module module_2 (
    input supply1 id_0,
    input supply0 id_1,
    input wand id_2,
    output supply0 id_3,
    input tri0 id_4
);
  assign id_3 = id_4;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_4,
      id_0
  );
  assign modCall_1.id_1 = 0;
  reg  id_6;
  wire id_7;
  final @(posedge id_6 or posedge "");
  assign id_3 = 1 ? 1 : id_1;
endmodule
