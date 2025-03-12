// Seed: 2233178242
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input uwire id_2,
    input tri0 id_3,
    output supply0 id_4
);
endmodule
module module_1 (
    input supply1 id_0,
    output wire id_1,
    output wand id_2,
    input wand id_3,
    input uwire id_4,
    output tri1 id_5,
    input tri1 id_6
);
  module_0 modCall_1 (
      id_3,
      id_4,
      id_6,
      id_0,
      id_5
  );
  assign modCall_1.id_0 = 0;
  assign id_5 = id_0;
endmodule
module module_2 (
    input tri0 id_0,
    output supply1 id_1,
    input tri id_2
);
  logic id_4;
  ;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_1
  );
endmodule
