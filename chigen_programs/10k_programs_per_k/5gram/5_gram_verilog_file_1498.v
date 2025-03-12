// Seed: 3599479053
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_11;
  wire \id_12 ;
endmodule
module module_1 (
    output tri   id_0,
    output wor   id_1,
    output uwire id_2,
    input  tri0  id_3,
    output wor   id_4,
    output logic id_5,
    input  wor   id_6,
    input  uwire id_7,
    output wire  id_8,
    output tri   id_9,
    output tri   id_10,
    input  wand  id_11
);
  logic id_13;
  logic id_14;
  wire  id_15;
  wire  id_16;
  assign id_14 = id_11 == id_14;
  assign id_5  = id_13;
  module_0 modCall_1 (
      id_16,
      id_13,
      id_15,
      id_14,
      id_14,
      id_16,
      id_15,
      id_13,
      id_15,
      id_16
  );
  assign id_14 = -1;
  always_comb @(posedge 1 or negedge {id_11, id_16 == id_3, -1} & id_14) begin : LABEL_0
    id_5 <= id_16;
  end
endmodule
