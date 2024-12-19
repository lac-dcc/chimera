// Seed: 4248995938
module module_0 (
    output supply1 id_0,
    output tri1 id_1,
    input tri1 id_2,
    output supply0 id_3,
    output wor id_4,
    input wire id_5,
    output wand id_6,
    input supply1 id_7,
    input supply0 id_8,
    input tri0 id_9,
    output supply1 id_10,
    output tri0 id_11,
    input tri id_12,
    output tri1 id_13,
    input tri0 id_14,
    input uwire id_15,
    input tri1 id_16,
    output tri0 id_17,
    input tri1 id_18,
    output tri0 id_19,
    output wor id_20,
    input supply0 id_21
    , id_24,
    output wire id_22
);
  assign id_1 = id_7;
  assign id_1 = id_7;
endmodule
module module_1 (
    output wire id_0,
    input wire id_1,
    output logic id_2,
    input tri0 id_3,
    input supply1 id_4,
    output supply0 id_5,
    output supply1 id_6,
    output tri0 id_7,
    input wor id_8,
    output wand id_9,
    output logic id_10
);
  supply0 id_12;
  xor primCall (id_0, id_13, id_4, id_3, id_12, id_1, id_8);
  initial begin : LABEL_0
    id_2 <= id_8 >= 1;
    id_10 = #id_13  ~id_12 & id_4;
  end
  module_0 modCall_1 (
      id_0,
      id_5,
      id_8,
      id_5,
      id_9,
      id_8,
      id_7,
      id_1,
      id_4,
      id_8,
      id_5,
      id_0,
      id_3,
      id_5,
      id_8,
      id_4,
      id_1,
      id_9,
      id_8,
      id_7,
      id_6,
      id_1,
      id_0
  );
  assign modCall_1.id_10 = 0;
endmodule
