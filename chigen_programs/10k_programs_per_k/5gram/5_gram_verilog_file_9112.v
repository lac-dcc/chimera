// Seed: 1534592294
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input supply1 id_2,
    input wor id_3,
    input tri1 id_4,
    output tri0 id_5
);
  assign id_5 = 1;
  module_2 modCall_1 ();
endmodule
module module_1 (
    input tri id_0,
    input tri1 id_1,
    input wor id_2,
    input wand id_3,
    input supply1 id_4,
    output wand id_5,
    input wire id_6
);
  assign id_5 = id_4;
  nor primCall (id_5, id_6, id_4);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_2,
      id_3,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 ();
  assign id_1 = 1'b0 + id_1;
  assign module_0.type_2 = 0;
  wire id_2;
endmodule
