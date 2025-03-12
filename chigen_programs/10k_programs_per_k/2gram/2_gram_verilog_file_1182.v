// Seed: 2368097832
module module_0 (
    input wor   id_0,
    input wire  id_1,
    input uwire id_2,
    input tri   id_3,
    input wire  id_4
);
endmodule
module module_1 (
    input wand id_0,
    input wand id_1,
    input tri id_2,
    input wor id_3,
    input wand id_4,
    input tri id_5,
    output supply1 id_6,
    input uwire id_7,
    input tri id_8
);
  wire id_10;
  assign id_6 = 1 & id_10;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_8,
      id_4
  );
  assign modCall_1.id_3 = 0;
  assign id_6 = {1, id_4 == id_7};
endmodule
