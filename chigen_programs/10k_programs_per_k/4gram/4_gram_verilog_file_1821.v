// Seed: 3127514752
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input wor id_2,
    input tri1 id_3,
    input uwire id_4,
    input supply1 id_5,
    input tri1 id_6,
    input tri1 id_7
    , id_18,
    input tri id_8,
    input tri1 id_9
    , id_19,
    output logic id_10,
    input supply0 id_11,
    output wand id_12,
    output uwire id_13,
    input supply0 id_14,
    input wire id_15,
    output tri0 id_16
);
  wire id_20;
  always id_10 <= id_6;
endmodule
module module_1 (
    output wand  id_0,
    input  tri0  id_1,
    output tri0  id_2,
    input  tri0  id_3,
    input  wor   id_4,
    output logic id_5,
    output tri   id_6,
    output tri1  id_7,
    output tri0  id_8,
    input  wor   id_9,
    input  uwire id_10,
    output logic id_11,
    input  wand  id_12,
    input  tri1  id_13,
    input  wire  id_14
);
  logic id_16;
  ;
  always @(negedge 1) begin : LABEL_0
    id_11 <= -1;
    id_5  <= -1;
  end
  assign id_5 = id_16;
  parameter id_17 = 1;
  assign id_6#(.id_10(-1'b0)) = id_17;
  wire id_18;
  wire id_19;
  ;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_12,
      id_9,
      id_1,
      id_3,
      id_4,
      id_9,
      id_9,
      id_3,
      id_11,
      id_13,
      id_8,
      id_6,
      id_4,
      id_10,
      id_8
  );
  assign modCall_1.id_4 = 0;
  wire id_20;
  ;
  logic id_21;
endmodule
