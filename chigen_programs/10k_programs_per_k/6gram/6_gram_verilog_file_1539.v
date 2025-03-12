// Seed: 3770790022
module module_0 (
    input wire id_0,
    input supply0 id_1,
    output logic id_2,
    input tri1 id_3,
    input tri1 id_4,
    input tri id_5,
    output wor id_6,
    input tri0 id_7,
    input supply0 id_8,
    input wor id_9,
    input wire id_10,
    output tri0 id_11,
    input tri id_12,
    input supply1 id_13,
    input uwire id_14,
    input wand id_15,
    output supply0 id_16,
    input wand id_17,
    input supply0 id_18,
    output wand id_19
);
  always @(1 or posedge id_17) begin : LABEL_0
    if (1 * 1) id_2 <= -1 - 1'b0;
  end
endmodule
module module_1 (
    input supply0 id_0,
    output logic id_1,
    input wor id_2,
    output supply0 id_3
    , id_9,
    input supply1 id_4,
    input supply0 id_5,
    input wor id_6,
    output wand id_7
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_6,
      id_4,
      id_5,
      id_3,
      id_4,
      id_0,
      id_2,
      id_0,
      id_3,
      id_2,
      id_2,
      id_4,
      id_2,
      id_7,
      id_2,
      id_5,
      id_7
  );
  assign modCall_1.id_3 = 0;
  always @(negedge id_6) id_1 = #1 1;
endmodule
