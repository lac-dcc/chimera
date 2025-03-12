// Seed: 1133755881
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input supply0 id_2,
    input wire id_3,
    input wand id_4
);
  parameter id_6 = 1;
  logic id_7;
  parameter id_8 = 1;
  assign module_1.id_15 = 0;
  logic id_9;
endmodule
module module_1 (
    input  wand  id_0,
    output wire  id_1,
    output wand  id_2,
    input  tri0  id_3,
    output wire  id_4,
    output logic id_5,
    input  wor   id_6,
    input  wire  id_7,
    input  wor   id_8,
    input  tri   id_9,
    input  tri0  id_10,
    input  wire  id_11,
    input  wand  id_12,
    input  wor   id_13
);
  wor id_15;
  always @(posedge id_15 !=? 1) begin : LABEL_0
    if ({1{1}}) id_5 = (id_6);
  end
  module_0 modCall_1 (
      id_8,
      id_11,
      id_11,
      id_13,
      id_9
  );
  assign id_5  = id_0;
  assign id_15 = (-1 == id_0);
  parameter id_16 = 1 ^ 1;
  parameter id_17 = 1 > 1;
  logic ["" : 1] id_18 = 1;
endmodule
