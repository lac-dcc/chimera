// Seed: 2820959446
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output uwire id_2,
    input tri1 id_3,
    input tri0 id_4,
    input supply0 id_5,
    input tri id_6,
    input uwire id_7,
    input tri1 id_8,
    input wire id_9,
    output tri1 id_10,
    output supply1 id_11,
    output tri id_12,
    input wor id_13,
    output tri id_14,
    input tri id_15,
    id_27,
    input tri1 id_16,
    input uwire id_17,
    output wand id_18,
    input wor id_19,
    input supply1 id_20,
    input tri0 id_21,
    input supply0 id_22,
    input tri id_23,
    input wire id_24,
    output wire id_25
);
  tri  id_28 = id_6;
  wire id_29;
  assign id_27 = 1;
  wire id_30;
  wire id_31;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input uwire id_1,
    input uwire id_2,
    output wand id_3,
    input supply0 id_4,
    input tri0 id_5,
    input tri id_6,
    output tri id_7,
    output tri1 id_8
);
  assign id_7 = id_2;
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_7,
      id_1,
      id_4,
      id_5,
      id_6,
      id_1,
      id_1,
      id_1,
      id_7,
      id_0,
      id_8,
      id_1,
      id_8,
      id_2,
      id_5,
      id_2,
      id_3,
      id_6,
      id_6,
      id_5,
      id_1,
      id_1,
      id_5,
      id_8
  );
endmodule
