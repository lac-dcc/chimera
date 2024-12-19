// Seed: 615679040
module module_0;
  tri0 id_1;
  assign module_2.id_3 = 0;
  assign id_1 = 1;
endmodule
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    module_1,
    id_8
);
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  tri0 id_10 = 1;
  wire id_11;
  xnor primCall (id_1, id_10, id_11, id_2, id_4, id_6, id_8);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    output logic id_0,
    input tri id_1,
    input logic id_2,
    input supply0 id_3
    , id_12,
    input logic id_4,
    output tri id_5,
    input wand id_6,
    output logic id_7,
    input wor id_8,
    output wand id_9,
    input supply1 id_10
);
  assign id_12 = 1 ^ 1;
  always_comb @(posedge ~id_4) begin : LABEL_0
    id_7 <= id_2;
    id_0 <= id_4;
  end
  assign id_12 = id_10;
  module_0 modCall_1 ();
  wire id_13;
  tri1 id_14 = 'b0;
  wire id_15;
endmodule
