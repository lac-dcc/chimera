// Seed: 1153956744
module module_0 (
    output wor id_0,
    input tri0 id_1,
    input tri0 id_2,
    output tri id_3,
    output wand id_4,
    input tri1 id_5,
    input wor id_6,
    output wand id_7,
    input wand id_8,
    input wand id_9,
    output wire id_10,
    output wor id_11,
    input uwire id_12,
    input tri id_13,
    input supply1 id_14,
    input tri1 id_15,
    output supply1 id_16,
    output wand id_17,
    input tri1 id_18,
    input wand id_19,
    output tri0 id_20,
    input supply0 id_21,
    input tri0 id_22,
    input uwire id_23
);
  always @(negedge id_6 | id_18);
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input wor id_0,
    output uwire id_1,
    input supply1 id_2,
    output wire id_3,
    output supply1 id_4,
    output tri1 id_5,
    input uwire id_6,
    input tri1 id_7,
    output tri1 id_8,
    input tri id_9,
    input tri0 id_10,
    output wor id_11,
    input wand id_12,
    input tri0 id_13,
    output logic id_14,
    output supply0 id_15,
    input wor id_16
);
  always #1 id_14 <= 1;
  module_0 modCall_1 (
      id_4,
      id_16,
      id_13,
      id_5,
      id_1,
      id_13,
      id_13,
      id_1,
      id_16,
      id_7,
      id_4,
      id_15,
      id_10,
      id_0,
      id_7,
      id_12,
      id_3,
      id_15,
      id_10,
      id_9,
      id_15,
      id_7,
      id_6,
      id_6
  );
endmodule
