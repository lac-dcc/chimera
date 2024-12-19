// Seed: 1572188586
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input tri id_2,
    output wand id_3,
    output wire id_4,
    output wand id_5,
    output tri id_6
);
endmodule
module module_1 (
    input tri0 id_0
    , id_21,
    input wire id_1,
    output logic id_2,
    input wor id_3,
    input wire id_4,
    input wand id_5,
    output logic id_6,
    input supply1 id_7,
    input supply0 id_8,
    output supply1 id_9,
    input tri0 id_10,
    input tri0 id_11,
    input tri1 id_12,
    input tri0 id_13,
    output logic id_14,
    input logic id_15,
    input tri id_16,
    input supply0 id_17,
    input logic id_18,
    input wand id_19
);
  always_latch
    for (id_6 = 1'd0; 1; id_21 = id_18) begin : LABEL_0
      id_2  <= id_15;
      id_21 <= 1'd0;
      if (1'b0) begin : LABEL_0
        id_14 <= 1;
      end
      id_6 <= 1;
    end
  module_0 modCall_1 (
      id_0,
      id_13,
      id_7,
      id_9,
      id_9,
      id_9,
      id_9
  );
  assign modCall_1.type_8 = 0;
  assign id_6 = 1;
  assign id_2 = 1;
  nor primCall (
      id_14,
      id_4,
      id_16,
      id_11,
      id_12,
      id_15,
      id_21,
      id_3,
      id_7,
      id_8,
      id_10,
      id_0,
      id_18,
      id_17,
      id_5,
      id_1,
      id_13,
      id_19
  );
  wire id_22;
  wire id_23;
endmodule
