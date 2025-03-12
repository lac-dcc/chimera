// Seed: 725211139
module module_0 (
    output uwire id_0,
    input wor id_1,
    input uwire id_2,
    output wire id_3,
    input wand id_4,
    input tri0 id_5
    , id_25,
    input supply1 id_6,
    output supply1 id_7,
    output wand id_8
    , id_26,
    input supply1 id_9,
    output wire id_10,
    input wire id_11,
    input wand id_12,
    input supply0 id_13,
    input supply1 id_14,
    input supply0 id_15,
    output supply1 id_16,
    input supply1 id_17,
    input tri id_18,
    output tri id_19,
    output uwire id_20,
    input wire id_21,
    input wor id_22,
    input wire id_23
);
  assign id_10 = id_12;
  assign module_1.id_11 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    output wire id_2,
    output tri1 id_3,
    output logic id_4,
    input tri id_5,
    input supply0 id_6,
    inout tri id_7,
    input uwire id_8,
    input uwire id_9,
    input uwire id_10,
    input supply1 id_11,
    output tri1 id_12,
    input supply0 id_13,
    input tri0 id_14
);
  always_comb @(posedge 1'b0) begin : LABEL_0
    id_4 <= id_6;
  end
  module_0 modCall_1 (
      id_3,
      id_11,
      id_11,
      id_3,
      id_9,
      id_0,
      id_7,
      id_2,
      id_3,
      id_5,
      id_12,
      id_7,
      id_7,
      id_8,
      id_8,
      id_1,
      id_2,
      id_0,
      id_14,
      id_7,
      id_12,
      id_1,
      id_10,
      id_10
  );
endmodule
