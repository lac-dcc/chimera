// Seed: 992218935
module module_0 (
    input tri0 id_0
    , id_19,
    output uwire id_1,
    output wand id_2,
    input supply1 id_3,
    input wand id_4,
    output wor id_5,
    input supply0 id_6,
    input tri id_7,
    output supply0 id_8,
    input tri id_9,
    input wor id_10,
    input supply1 id_11,
    output supply1 id_12,
    output wand id_13,
    input supply0 id_14,
    input supply0 id_15,
    output wor id_16,
    input uwire id_17
);
  wire [-1 : 1] id_20, id_21;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    input tri id_2,
    output uwire id_3,
    input supply0 id_4
);
  assign id_3 = 1'b0 == 1'b0;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_3,
      id_4,
      id_0,
      id_3,
      id_0,
      id_4,
      id_3,
      id_4,
      id_2,
      id_1,
      id_3,
      id_3,
      id_0,
      id_4,
      id_3,
      id_2
  );
  parameter id_6 = 1;
  assign id_3 = (id_4.id_4);
endmodule
