// Seed: 3926373171
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input tri0 id_2,
    output wire id_3,
    output wand id_4
);
endmodule
module module_1 (
    input uwire id_0,
    output tri id_1,
    input supply0 id_2,
    input wire id_3,
    inout wor id_4,
    input supply1 id_5,
    input tri1 id_6,
    output tri1 id_7,
    input wor id_8,
    output uwire id_9,
    input tri0 id_10,
    output tri id_11
);
  wire id_13;
  assign id_11 = 1;
  nor primCall (id_9, id_8, id_14, id_3, id_0, id_6, id_10, id_2, id_4, id_13);
  wand id_14 = id_3;
  always if (id_14) id_4 = id_0;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_9,
      id_9
  );
  assign modCall_1.id_1 = 0;
endmodule
