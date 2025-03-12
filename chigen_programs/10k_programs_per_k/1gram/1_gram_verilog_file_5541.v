// Seed: 2412072678
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input tri0 id_3,
    input tri id_4,
    output wor id_5,
    input supply1 id_6,
    output supply0 void id_7,
    input supply1 id_8,
    output tri id_9,
    output wand id_10,
    input tri id_11,
    input uwire id_12,
    output tri0 id_13,
    input wor id_14,
    input supply0 id_15,
    input supply0 id_16,
    output supply1 id_17,
    input tri id_18,
    input supply1 id_19,
    output uwire id_20,
    input supply0 id_21,
    input uwire id_22,
    input tri id_23,
    input wand id_24,
    output tri id_25,
    input tri1 id_26,
    input wire id_27
);
  wire id_29;
  assign id_29 = (id_4);
endmodule
module module_1 (
    output logic id_0,
    input supply1 id_1,
    output supply1 id_2,
    input tri0 id_3,
    input tri0 id_4,
    output supply0 id_5
);
  wire id_7;
  parameter id_8 = -1;
  always id_0 <= #id_3 1;
  wire id_9, id_10;
  or primCall (id_0, id_3, id_4, id_10, id_7, id_9);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_5,
      id_1,
      id_4,
      id_5,
      id_1,
      id_5,
      id_1,
      id_2,
      id_5,
      id_4,
      id_3,
      id_2,
      id_4,
      id_3,
      id_3,
      id_2,
      id_3,
      id_1,
      id_5,
      id_1,
      id_1,
      id_3,
      id_1,
      id_2,
      id_4,
      id_1
  );
  assign modCall_1.id_25 = 0;
  assign id_0 = id_10;
endmodule
