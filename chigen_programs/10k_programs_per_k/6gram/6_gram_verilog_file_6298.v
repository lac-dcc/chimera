// Seed: 1385476644
module module_0 (
    output wire  id_0,
    output tri0  id_1,
    input  uwire id_2,
    input  uwire id_3,
    output wor   id_4
);
  logic id_6;
  ;
  wire  id_7;
  logic id_8 = id_2 ^ -1'd0 - 1'b0;
  assign id_4 = 1;
endmodule
module module_1 (
    output tri1 id_0,
    input wor id_1,
    output tri0 id_2,
    output wor id_3,
    input supply1 id_4,
    input supply1 id_5,
    input wor id_6,
    output supply1 id_7,
    input wand id_8,
    input tri id_9,
    output logic id_10,
    input wire id_11,
    output wor id_12
    , id_21,
    output wor id_13,
    input wire id_14,
    output wor id_15,
    input wire id_16,
    output supply0 id_17,
    input uwire id_18,
    output wire id_19
);
  wire id_22;
  module_0 modCall_1 (
      id_2,
      id_19,
      id_1,
      id_4,
      id_0
  );
  assign modCall_1.id_1 = 0;
  always @(posedge id_18 or posedge 1'b0) begin : LABEL_0
    id_10 = id_14 & "" | 1;
  end
endmodule
