// Seed: 3568744541
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input uwire id_3,
    output supply0 id_4,
    output tri0 id_5,
    output supply1 id_6,
    input tri0 id_7,
    output supply1 id_8,
    input wand id_9
);
  wire id_11;
  ;
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    input tri id_2,
    input tri1 id_3,
    output tri1 id_4,
    input wire id_5,
    output wor id_6,
    input tri id_7,
    input tri id_8,
    output logic id_9,
    output uwire id_10,
    input tri1 id_11,
    input wor id_12,
    input tri id_13,
    input tri1 id_14,
    output uwire id_15,
    output logic id_16,
    output wor id_17,
    input supply0 id_18,
    input wand id_19,
    output wor id_20,
    input tri1 id_21,
    output tri1 id_22,
    input wand id_23,
    input tri0 id_24,
    output tri0 id_25,
    output wand id_26,
    output wand id_27,
    input supply0 id_28,
    input wor id_29,
    output wor id_30,
    output tri0 id_31,
    input supply0 id_32,
    input tri id_33,
    output tri0 id_34,
    input supply0 id_35
);
  always id_9 = id_19;
  module_0 modCall_1 (
      id_34,
      id_5,
      id_5,
      id_12,
      id_20,
      id_27,
      id_4,
      id_33,
      id_25,
      id_21
  );
  assign modCall_1.id_7 = 0;
  assign id_4 = id_7;
  always
  fork
    id_16 <= 1;
  join
  parameter id_37 = 1;
  assign id_31 = !id_19 && id_12;
endmodule
