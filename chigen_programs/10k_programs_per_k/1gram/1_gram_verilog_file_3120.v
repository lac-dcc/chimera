// Seed: 1718452316
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    output wor id_2,
    output supply0 id_3,
    input uwire id_4,
    input wor id_5,
    input supply0 id_6,
    output tri id_7,
    output wire id_8,
    input uwire id_9,
    input supply0 id_10,
    input wire id_11,
    input wand id_12,
    input supply0 id_13,
    output tri0 id_14,
    input wand id_15,
    input uwire id_16
);
  wire [-1 : 1] id_18, id_19;
  parameter id_20 = -1;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd23
) (
    output supply1 _id_0,
    input wire id_1,
    input wand id_2[id_0 : -1],
    input wor id_3,
    output wire id_4
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_4,
      id_3,
      id_1,
      id_2,
      id_4,
      id_4,
      id_2,
      id_2,
      id_1,
      id_3,
      id_3,
      id_4,
      id_1,
      id_3
  );
endmodule
