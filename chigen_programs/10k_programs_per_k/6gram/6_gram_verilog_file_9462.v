// Seed: 1709637494
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    output tri1 id_2,
    output tri0 id_3,
    input wand id_4,
    output wire id_5,
    input tri0 id_6,
    input wor id_7,
    input wor id_8,
    output wand id_9,
    input tri1 id_10,
    input wand id_11,
    input uwire id_12,
    input tri1 id_13,
    output wire id_14,
    input tri1 id_15,
    input supply1 id_16,
    input tri id_17
);
  assign id_2 = -1;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    output tri0 id_1,
    output supply1 id_2,
    output wand id_3,
    input wand id_4,
    input tri0 id_5,
    input wire id_6,
    input supply0 id_7,
    input tri0 id_8,
    input tri0 id_9,
    output tri1 id_10,
    input tri0 id_11,
    input uwire id_12,
    input tri1 id_13,
    output logic id_14,
    output wire id_15,
    output tri id_16
    , id_22,
    input uwire id_17,
    input uwire id_18,
    input wire id_19,
    input wand id_20
);
  wire id_23;
  always @(id_22 or negedge -1) begin : LABEL_0
    id_14 <= id_19;
  end
  nor primCall (
      id_1,
      id_23,
      id_4,
      id_8,
      id_5,
      id_13,
      id_11,
      id_19,
      id_0,
      id_12,
      id_20,
      id_7,
      id_9,
      id_22,
      id_17
  );
  module_0 modCall_1 (
      id_16,
      id_11,
      id_3,
      id_10,
      id_11,
      id_2,
      id_13,
      id_19,
      id_19,
      id_2,
      id_11,
      id_8,
      id_7,
      id_20,
      id_10,
      id_0,
      id_17,
      id_18
  );
endmodule
