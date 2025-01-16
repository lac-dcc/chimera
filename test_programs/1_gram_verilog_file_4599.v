// Seed: 2276899042
module module_0 (
    input wire id_0,
    input uwire id_1,
    input supply1 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply0 id_5,
    input wor id_6,
    input uwire id_7,
    input tri id_8
);
  tri id_10 = 1, id_11, id_12, id_13, id_14;
  assign id_11 = $realtime;
  wire id_15;
  wire id_16;
  always id_10 = -1;
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    input wor id_2,
    input tri1 id_3,
    input wand id_4,
    input tri0 id_5,
    input supply1 id_6,
    input supply1 id_7,
    input wand id_8,
    output tri1 id_9,
    output logic id_10,
    output wire id_11,
    output wor id_12
);
  assign id_10 = -1'b0;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_8,
      id_5,
      id_2,
      id_8,
      id_7,
      id_6,
      id_6
  );
  assign modCall_1.id_6 = 0;
  always id_10 <= 1;
endmodule
