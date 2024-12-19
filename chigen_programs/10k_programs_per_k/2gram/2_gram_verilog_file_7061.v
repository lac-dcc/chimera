// Seed: 52681876
module module_0 (
    output wor id_0,
    input tri0 id_1,
    input wor id_2,
    output wor id_3,
    output supply0 id_4,
    output wand id_5,
    output tri0 id_6,
    input wor id_7,
    input tri1 id_8,
    input uwire id_9,
    input uwire id_10,
    output wire id_11,
    input uwire id_12,
    input tri0 id_13,
    output tri1 id_14,
    input tri0 id_15,
    input uwire id_16,
    output wire id_17,
    input uwire id_18
);
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input uwire id_1,
    output wire id_2,
    input wor id_3,
    input supply0 id_4,
    output supply0 id_5
);
  always_latch id_5 = {id_4 !== 1{1 + id_3}};
  genvar id_7;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_4,
      id_0,
      id_0,
      id_5,
      id_5,
      id_3,
      id_3,
      id_3,
      id_3,
      id_5,
      id_3,
      id_3,
      id_2,
      id_4,
      id_3,
      id_2,
      id_3
  );
endmodule
