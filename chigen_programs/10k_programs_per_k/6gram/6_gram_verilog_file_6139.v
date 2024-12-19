// Seed: 1213961261
module module_0 (
    input supply1 id_0,
    output wire id_1,
    input supply0 id_2,
    input wand id_3,
    input tri1 id_4,
    input uwire id_5,
    input wire id_6,
    output uwire id_7,
    output supply1 id_8,
    input supply0 id_9,
    input wire id_10,
    input tri1 id_11,
    input supply0 id_12,
    input wire id_13,
    output wor id_14,
    input wire id_15,
    output tri id_16,
    input supply1 id_17,
    output uwire id_18,
    input wand id_19,
    output wor id_20,
    input uwire id_21,
    input tri id_22,
    output wand id_23,
    output wor id_24
);
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    input logic id_2,
    input tri0 id_3,
    input supply1 id_4,
    input supply0 id_5,
    input wor id_6,
    input wand id_7,
    output supply0 id_8
);
  assign id_8 = 1 | id_2;
  generate
    for (id_10 = 1'd0; 1 == 1; id_10 = id_2) begin : LABEL_0
      for (id_11 = 1; 1 - 1'b0; id_8 = id_5) begin : LABEL_0
        always @(1 == "") id_10 = #1 1;
      end
    end
  endgenerate
  wand id_12 = 1;
  module_0 modCall_1 (
      id_4,
      id_8,
      id_7,
      id_4,
      id_5,
      id_4,
      id_4,
      id_8,
      id_8,
      id_0,
      id_0,
      id_1,
      id_4,
      id_6,
      id_8,
      id_0,
      id_8,
      id_7,
      id_8,
      id_0,
      id_8,
      id_0,
      id_3,
      id_8,
      id_8
  );
  assign modCall_1.id_23 = 0;
endmodule
