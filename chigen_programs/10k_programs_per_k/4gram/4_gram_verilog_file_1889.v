// Seed: 1959301581
module module_0 (
    input supply0 id_0,
    output logic id_1,
    input tri1 id_2,
    input wand id_3,
    output supply1 id_4,
    output tri1 id_5,
    output wor id_6,
    input wire id_7,
    input tri0 id_8
);
  always @(negedge id_0 or negedge id_7) begin : LABEL_0
    id_1 <= 1;
  end
  assign module_1.type_14 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output supply0 id_1,
    output tri id_2,
    input wor id_3
    , id_20,
    input tri1 id_4,
    output logic id_5,
    output tri id_6,
    output supply1 id_7,
    output wand id_8,
    input supply1 id_9,
    input supply0 id_10,
    input wor id_11,
    input wire id_12,
    output wand id_13,
    input tri id_14,
    output uwire id_15,
    input uwire id_16,
    input wand id_17,
    input supply1 id_18
);
  wand id_21 = 1;
  always @(negedge id_21) id_5 <= 1;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_14,
      id_9,
      id_2,
      id_8,
      id_6,
      id_18,
      id_14
  );
endmodule
