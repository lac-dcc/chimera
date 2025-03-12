// Seed: 30754820
module module_0 (
    output tri id_0,
    input tri1 id_1,
    output supply1 id_2,
    input uwire id_3,
    input uwire id_4,
    output wire id_5,
    output wand id_6,
    output supply0 id_7,
    input tri1 id_8,
    output tri id_9,
    output wor id_10,
    output wire id_11,
    input tri0 id_12,
    input wire id_13,
    input uwire id_14,
    input tri id_15,
    input tri0 id_16,
    input supply0 id_17,
    input supply0 id_18,
    input wire id_19
);
  wire id_21;
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input tri1 id_1,
    input wire id_2,
    input supply0 id_3,
    input supply0 id_4,
    output logic id_5,
    input wire id_6,
    output wire id_7,
    output wor id_8,
    input wire id_9,
    output tri id_10,
    input supply1 id_11,
    input wand id_12,
    output tri0 id_13,
    output tri1 id_14,
    output tri1 id_15
);
  logic id_17;
  logic id_18;
  wire id_19, id_20;
  module_0 modCall_1 (
      id_15,
      id_1,
      id_15,
      id_4,
      id_6,
      id_15,
      id_13,
      id_15,
      id_9,
      id_15,
      id_14,
      id_13,
      id_3,
      id_12,
      id_2,
      id_0,
      id_9,
      id_6,
      id_9,
      id_11
  );
  always @(negedge -1 or posedge 1'h0) begin : LABEL_0
    id_5 <= id_17;
  end
  assign id_14 = 1 < id_20;
endmodule
