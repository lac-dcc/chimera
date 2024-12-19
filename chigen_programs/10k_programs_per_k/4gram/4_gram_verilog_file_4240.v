// Seed: 3089476505
module module_0 (
    input supply1 id_0,
    output tri id_1,
    input supply0 id_2,
    output tri id_3,
    output wor id_4,
    input wire id_5,
    output wor id_6,
    output wand id_7,
    input tri0 id_8,
    input tri1 id_9,
    input tri0 id_10,
    input wor id_11,
    output supply1 id_12,
    input wire id_13,
    input wand id_14,
    input wor id_15,
    output wor id_16,
    output tri1 id_17,
    input supply1 id_18,
    input tri0 id_19,
    output tri0 id_20,
    input wire id_21,
    output uwire id_22,
    output wire id_23,
    output logic id_24,
    output supply1 id_25,
    input tri id_26,
    output tri1 id_27
);
  always_ff @(posedge 1 or posedge id_10) begin : LABEL_0
    id_24 <= id_19 == 1'b0;
  end
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    output tri id_0,
    input uwire id_1,
    output logic id_2,
    output supply1 id_3,
    input tri id_4,
    output tri1 id_5,
    input tri id_6,
    input uwire id_7,
    input wor id_8,
    output uwire id_9,
    output wor id_10,
    output tri id_11,
    input tri id_12,
    input logic id_13,
    output supply0 id_14,
    input uwire id_15,
    output wand id_16,
    input wire id_17
);
  always_ff @(id_13 !== 1'b0 or 'b0) begin : LABEL_0
    id_2 <= id_13;
  end
  module_0 modCall_1 (
      id_4,
      id_16,
      id_17,
      id_3,
      id_11,
      id_12,
      id_3,
      id_10,
      id_6,
      id_17,
      id_12,
      id_15,
      id_14,
      id_12,
      id_4,
      id_8,
      id_3,
      id_10,
      id_8,
      id_4,
      id_9,
      id_8,
      id_11,
      id_0,
      id_2,
      id_14,
      id_15,
      id_10
  );
  always @(posedge id_13 or posedge 1) begin : LABEL_0
    deassign id_5;
    id_9 = id_17;
  end
  generate
    tri1 id_19 = 1 - 1;
  endgenerate
endmodule
