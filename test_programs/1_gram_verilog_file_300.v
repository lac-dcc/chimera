// Seed: 4288651660
module module_0 (
    output wand id_0,
    input wand id_1,
    input tri0 id_2,
    output tri0 id_3,
    output wire id_4,
    input supply0 id_5,
    input uwire id_6
);
  wire id_8;
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    inout supply1 id_2,
    input uwire id_3,
    input uwire id_4,
    input wire id_5,
    input wand id_6,
    output tri id_7
);
  wire id_9;
  tri  id_10 = 1;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_1,
      id_1,
      id_5,
      id_6
  );
  assign modCall_1.id_5 = 0;
endmodule
