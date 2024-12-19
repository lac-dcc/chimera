// Seed: 1340649600
module module_0 (
    output wire id_0,
    input wand id_1,
    output tri0 id_2,
    input uwire id_3,
    input tri1 id_4,
    input tri id_5,
    output supply0 id_6,
    output wire id_7,
    output tri id_8,
    input uwire id_9,
    input tri0 id_10,
    output wor id_11
    , id_21,
    output tri0 id_12,
    input wand id_13
    , id_22,
    output supply0 id_14,
    output wor id_15,
    input tri1 id_16,
    input uwire id_17,
    input tri0 id_18,
    input wor id_19
);
  wire id_23;
  wire id_24;
endmodule
module module_1 (
    input tri1 id_0,
    output wand id_1,
    output tri1 id_2,
    output wand id_3,
    output logic id_4,
    output uwire id_5,
    input tri1 id_6,
    output supply1 id_7,
    input supply0 id_8,
    output wor id_9,
    input tri0 id_10,
    input wand id_11,
    input wire id_12,
    output tri0 id_13,
    input wor id_14,
    input tri1 id_15,
    input tri0 id_16,
    input wire id_17,
    output tri1 id_18,
    input logic id_19,
    input supply1 id_20,
    output tri id_21,
    output wor id_22,
    output tri1 id_23,
    input wand id_24,
    input wire id_25,
    output logic id_26
);
  assign id_13 = 1;
  reg id_28;
  always @(1 or posedge 1 - 1)
    if (1 - id_16) begin : LABEL_0
      id_26 <= id_19;
    end else if (id_15) begin : LABEL_0
      if (id_6) begin : LABEL_0
        id_4 <= id_28;
      end
    end
  module_0 modCall_1 (
      id_3,
      id_25,
      id_3,
      id_14,
      id_6,
      id_12,
      id_3,
      id_1,
      id_5,
      id_25,
      id_16,
      id_23,
      id_3,
      id_11,
      id_9,
      id_22,
      id_12,
      id_20,
      id_6,
      id_12
  );
  assign modCall_1.id_1 = 0;
  wire id_29, id_30;
  and primCall (
      id_2,
      id_24,
      id_20,
      id_16,
      id_19,
      id_15,
      id_0,
      id_14,
      id_8,
      id_25,
      id_6,
      id_10,
      id_11,
      id_17,
      id_28
  );
endmodule
