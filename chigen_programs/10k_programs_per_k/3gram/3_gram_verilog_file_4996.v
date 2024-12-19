// Seed: 529018619
module module_0 (
    input tri id_0,
    input tri id_1,
    input supply0 id_2,
    input uwire id_3,
    input tri0 id_4,
    output tri1 id_5,
    input tri1 id_6,
    output supply1 id_7,
    input wor id_8,
    output tri0 id_9,
    output supply1 id_10,
    output supply0 id_11,
    output wire id_12,
    input wire id_13,
    output uwire id_14,
    output supply0 id_15,
    output wand id_16,
    input tri0 id_17,
    input wor id_18,
    input uwire id_19,
    input tri1 id_20,
    output tri id_21,
    input wor id_22
);
  assign id_9 = id_20 ? id_20 : 1;
  assign module_1.type_7 = 0;
  wire id_24;
endmodule
module module_1 (
    input tri1 id_0,
    output supply1 id_1,
    output uwire id_2,
    output wand id_3,
    input tri1 id_4,
    output logic id_5,
    input wor id_6,
    output wand id_7,
    input wor id_8,
    output supply0 id_9,
    input wand id_10,
    input wor id_11
);
  wire id_13;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_4,
      id_11,
      id_9,
      id_10,
      id_9,
      id_10,
      id_9,
      id_1,
      id_1,
      id_2,
      id_8,
      id_2,
      id_7,
      id_7,
      id_8,
      id_11,
      id_4,
      id_6,
      id_1,
      id_0
  );
  always @(1 or id_0) id_5 <= 1;
endmodule
