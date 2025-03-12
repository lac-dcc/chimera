// Seed: 63892156
module module_0 (
    input supply0 id_0,
    input wand id_1,
    output wire id_2,
    input supply0 id_3,
    input tri id_4,
    input uwire id_5,
    output supply0 id_6,
    input tri id_7,
    input uwire id_8,
    output uwire id_9
    , id_23,
    input tri1 id_10
    , id_24,
    input supply0 id_11,
    input tri id_12,
    input tri1 id_13,
    input wire id_14,
    input supply1 id_15,
    input tri id_16,
    output supply0 id_17,
    input wire id_18,
    output wor id_19,
    input tri id_20,
    output tri1 id_21
);
  wire  id_25;
  logic id_26;
  ;
  assign id_26 = id_5 - id_10;
endmodule
module module_1 (
    input  wire  id_0,
    output logic id_1,
    output wand  id_2,
    input  wand  id_3,
    output wire  id_4
);
  always @(posedge -1) begin : LABEL_0
    id_1 = id_3;
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_3,
      id_2,
      id_0,
      id_3,
      id_4,
      id_3,
      id_0,
      id_3,
      id_0,
      id_3,
      id_0,
      id_3,
      id_2,
      id_0,
      id_4,
      id_0,
      id_2
  );
  assign modCall_1.id_12 = 0;
endmodule
