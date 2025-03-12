// Seed: 1430836062
module module_0 (
    output supply0 id_0,
    input wand id_1,
    input uwire id_2,
    input tri id_3,
    input wor id_4,
    output supply1 id_5,
    input supply1 id_6,
    input tri0 id_7,
    input supply1 id_8,
    output wand id_9
);
endmodule
module module_1 (
    input uwire id_0,
    input wor id_1,
    output supply0 id_2,
    output wire id_3,
    input uwire id_4,
    output tri0 id_5,
    output tri0 id_6,
    output supply0 id_7,
    output uwire id_8,
    inout supply0 id_9,
    output wand id_10
);
  wire id_12;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_9,
      id_1,
      id_1,
      id_5,
      id_4,
      id_9,
      id_1,
      id_8
  );
  assign modCall_1.id_6 = 0;
endmodule
