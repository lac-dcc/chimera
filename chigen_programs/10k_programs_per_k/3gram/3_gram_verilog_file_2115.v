// Seed: 458763924
module module_0 (
    output tri0 id_0,
    input tri0 id_1,
    output supply0 id_2,
    output wand id_3,
    input tri1 id_4,
    input wand id_5,
    input tri0 id_6,
    output wand id_7
);
endmodule
module module_1 (
    input tri1 id_0,
    output supply0 id_1,
    input uwire id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_0,
      id_2,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    output wand id_0,
    output tri0 id_1,
    input uwire id_2,
    input uwire id_3,
    output supply1 id_4
);
  assign id_0 = 1'd0;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_4,
      id_3,
      id_3,
      id_2,
      id_4
  );
endmodule
