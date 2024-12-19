// Seed: 1891002173
module module_0 (
    input wand id_0,
    output supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input wor id_4,
    output wire id_5,
    input wand id_6
);
  assign id_5 = 1'b0;
  wire id_8;
  wire id_9;
  supply0 id_10 = 1'b0;
endmodule
module module_1 (
    output supply0 id_0,
    input wor id_1,
    input uwire id_2,
    input supply0 id_3,
    output logic id_4,
    output tri id_5,
    output supply1 id_6,
    input wand id_7,
    input supply1 id_8,
    input uwire id_9,
    input wor id_10,
    input wire id_11,
    output uwire id_12,
    output supply0 id_13,
    input wire id_14,
    output wand id_15,
    input supply0 id_16,
    input tri id_17,
    input supply1 id_18,
    input uwire id_19
);
  always @(1, id_3 or posedge 1'h0) begin : LABEL_0
    if (1) id_4 <= 1 - (id_7);
  end
  always disable id_21;
  wire id_22;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_2,
      id_19,
      id_9,
      id_0,
      id_17
  );
  assign modCall_1.id_0 = 0;
endmodule
