// Seed: 3618241064
module module_0 (
    input supply0 id_0,
    input tri id_1,
    input tri0 id_2,
    output wor id_3,
    input wor id_4,
    input supply1 id_5,
    input tri1 id_6,
    output uwire id_7,
    output tri0 id_8,
    output tri0 id_9,
    input wire id_10,
    input supply1 id_11,
    input supply1 id_12,
    input supply0 id_13,
    input supply0 id_14,
    input wor id_15,
    output wor id_16,
    input wire id_17,
    input wor id_18,
    input wor id_19,
    input tri1 id_20,
    output tri1 id_21,
    output supply1 id_22
);
  assign id_21 = id_5;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input supply0 id_1,
    input wand id_2,
    output logic id_3,
    input tri0 id_4,
    input tri id_5,
    output tri1 id_6,
    output wor id_7
);
  assign id_6 = id_2;
  assign id_7 = id_4;
  assign id_7 = 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_4,
      id_4,
      id_5,
      id_6,
      id_6,
      id_0,
      id_4,
      id_5,
      id_5,
      id_1,
      id_2,
      id_2,
      id_0,
      id_2,
      id_5,
      id_2,
      id_4,
      id_6,
      id_7
  );
  initial begin : LABEL_0
    id_3 <= id_5;
  end
endmodule
