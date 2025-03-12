// Seed: 4175606104
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input supply0 id_2,
    output logic id_3,
    output logic id_4,
    input supply0 id_5,
    input wor id_6,
    output wire id_7,
    output tri1 id_8,
    input tri id_9,
    input supply1 id_10,
    input wire id_11,
    input uwire id_12,
    input wire id_13,
    input tri0 id_14,
    input tri0 id_15,
    output supply1 id_16,
    input tri1 id_17,
    output tri1 id_18,
    output wand id_19,
    input tri0 id_20,
    input wand id_21,
    output wand id_22
);
  wire id_24;
  always @(posedge id_15 == 1 or negedge id_1) begin : LABEL_0
    id_3 <= id_14;
    id_4 = id_0;
  end
  wire id_25;
endmodule
module module_1 (
    output supply1 id_0,
    output logic id_1
    , id_17,
    input wand id_2,
    output supply0 id_3,
    output tri id_4,
    input tri id_5,
    input supply1 id_6,
    input supply0 id_7,
    output tri1 id_8,
    input uwire id_9,
    input uwire id_10,
    input tri0 id_11,
    output supply1 id_12,
    input wire id_13,
    input supply1 id_14,
    output tri id_15
);
  always repeat (1 & "") id_1 <= -1;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_13,
      id_1,
      id_1,
      id_5,
      id_13,
      id_12,
      id_8,
      id_7,
      id_9,
      id_9,
      id_10,
      id_2,
      id_14,
      id_2,
      id_3,
      id_7,
      id_15,
      id_4,
      id_14,
      id_7,
      id_3
  );
  assign modCall_1.id_9 = 0;
endmodule
