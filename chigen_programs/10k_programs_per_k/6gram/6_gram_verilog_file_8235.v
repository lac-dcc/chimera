// Seed: 1295130426
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input wire id_2,
    input tri id_3,
    input tri1 id_4,
    input wor id_5,
    input tri id_6,
    output supply1 id_7,
    input wand id_8,
    input wand id_9
    , id_12,
    output tri id_10
);
endmodule
module module_1 (
    output tri1 id_0,
    input  wire id_1
);
  assign id_0 = id_1 - {1'b0, id_1};
  tri1 id_3;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.type_2 = 0;
  assign id_0 = id_3;
endmodule
