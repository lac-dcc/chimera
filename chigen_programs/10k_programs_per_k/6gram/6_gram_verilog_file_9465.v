// Seed: 4060781483
module module_0 (
    inout tri0 id_0,
    output wire id_1,
    input supply0 id_2,
    input wor id_3,
    output supply0 id_4,
    input wire id_5,
    input wor id_6,
    input supply0 id_7,
    output tri0 id_8,
    output tri1 id_9,
    inout wand id_10,
    output supply1 id_11,
    input tri1 id_12,
    input wor id_13,
    input supply1 id_14,
    output supply0 id_15,
    input tri0 id_16,
    input supply1 id_17,
    input tri1 id_18,
    output supply1 id_19,
    input tri id_20,
    input supply1 id_21
);
endmodule
module module_1 (
    inout wire id_0,
    output wor id_1,
    output logic id_2,
    input wand id_3,
    output tri id_4,
    output logic id_5,
    input uwire id_6,
    input supply0 id_7,
    input supply1 id_8,
    input wand id_9
);
  assign id_0 = id_7;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_8,
      id_9,
      id_1,
      id_6,
      id_7,
      id_6,
      id_1,
      id_1,
      id_0,
      id_0,
      id_3,
      id_3,
      id_9,
      id_4,
      id_8,
      id_3,
      id_8,
      id_1,
      id_7,
      id_0
  );
  assign modCall_1.id_3 = 0;
  initial begin : LABEL_0
    id_2 <= 1;
    id_5 <= id_3 == id_6;
    id_2 = ~id_6;
  end
endmodule
