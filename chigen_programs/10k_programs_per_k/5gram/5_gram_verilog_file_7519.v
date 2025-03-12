// Seed: 550691760
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input tri id_2,
    input uwire id_3,
    input tri0 id_4,
    output supply0 id_5,
    output wand id_6,
    input wand id_7,
    output uwire id_8,
    output wand id_9,
    output uwire id_10,
    input tri id_11,
    output tri1 id_12
    , id_18, id_19,
    input wand id_13,
    output supply1 id_14,
    input supply1 id_15,
    input tri0 id_16
);
  assign id_8 = {1'h0};
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  wire  id_1,
    input  tri0  id_2,
    input  wire  id_3,
    output logic id_4,
    output tri0  id_5
);
  always_latch @(~id_2 or posedge id_2) begin : LABEL_0
    id_4 = 1;
    id_0 = 1 * id_1 - id_1;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_5,
      id_5,
      id_3,
      id_5,
      id_5,
      id_5,
      id_1,
      id_5,
      id_3,
      id_5,
      id_2,
      id_1
  );
  wire [-1 : -1] id_7;
endmodule
