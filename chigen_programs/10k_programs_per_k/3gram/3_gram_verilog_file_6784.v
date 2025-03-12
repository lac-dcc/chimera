// Seed: 798087878
module module_0 (
    input uwire id_0,
    input uwire id_1,
    output tri id_2,
    output wor id_3,
    input uwire id_4,
    input uwire id_5,
    output uwire id_6,
    output supply0 id_7,
    input wor id_8,
    input wand id_9,
    input wire id_10,
    input wor id_11,
    output supply0 id_12,
    output supply1 id_13,
    input wand id_14,
    input supply1 id_15,
    output supply0 id_16
);
  wire id_18;
endmodule
module module_1 (
    input wire id_0,
    input supply0 id_1,
    output tri0 id_2,
    output tri1 id_3
);
  parameter id_5 = 1;
  nor primCall (id_3, id_1, id_5, id_0);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_2,
      id_3,
      id_0,
      id_1,
      id_2,
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_3,
      id_3,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
