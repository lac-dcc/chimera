// Seed: 2116989645
module module_0 (
    input  tri1  id_0,
    input  uwire id_1,
    output tri   id_2,
    input  tri   id_3,
    output tri   id_4
);
  assign id_2 = id_0.id_0;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input wor id_2,
    output uwire id_3,
    input supply0 id_4,
    input tri id_5,
    output tri id_6,
    output supply1 id_7,
    output wor id_8,
    input uwire id_9,
    output uwire id_10,
    output logic id_11,
    output tri id_12,
    input wand id_13
);
  assign id_7 = id_0;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_6,
      id_9,
      id_8
  );
  assign modCall_1.id_3 = 0;
  initial id_11 <= id_4.id_9;
endmodule
