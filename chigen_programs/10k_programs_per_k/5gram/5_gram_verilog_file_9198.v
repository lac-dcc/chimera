// Seed: 174802435
module module_0 (
    output tri0 id_0,
    input wand id_1,
    input tri0 id_2,
    input tri id_3,
    input uwire id_4,
    output wor id_5,
    input supply1 id_6,
    input tri id_7,
    output wand module_0,
    output wire id_9,
    input wor id_10,
    output tri0 id_11,
    input supply1 id_12,
    output tri1 id_13
);
  specify
    (posedge id_15 => (id_16 +: 1)) = (id_3, -1);
  endspecify
endmodule
module module_1 (
    input wor id_0,
    output wire id_1,
    input wire id_2,
    input wand id_3,
    output supply0 id_4
);
  assign id_4 = id_2;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_0,
      id_0,
      id_1,
      id_4,
      id_2,
      id_1,
      id_3,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
