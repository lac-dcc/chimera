// Seed: 2468389744
module module_0 (
    input  wor   id_0,
    input  uwire id_1,
    input  tri1  id_2
    , id_10,
    input  wand  id_3
    , id_11 = 1'b0,
    input  tri0  id_4,
    output tri0  id_5,
    input  wand  id_6,
    input  tri1  id_7,
    input  logic id_8
);
  initial begin
    id_5 = (id_11 & id_7);
  end
  reg id_12;
  always id_12 <= id_8;
  assign id_12 = 1'b0;
  wire id_13;
  wire id_14;
  generate
    wire id_15;
    assign id_5 = 1'b0;
    wire id_16;
    assign id_15 = id_7;
    wire id_17;
  endgenerate
  wire id_18;
endmodule
module module_1 (
    output wand id_0,
    input logic id_1,
    output wor id_2,
    output tri1 id_3,
    output logic id_4,
    output supply1 id_5,
    input tri1 id_6,
    output supply0 id_7,
    input wire id_8
);
  assign id_2 = 1;
  always begin
    $display(1, 1, id_8, id_8);
    if ({id_6, 1, id_1, id_8, id_6, id_8}) id_5 = 1;
    id_4 <= id_1;
  end
  wire id_10;
  assign id_4 = id_1;
  module_0(
      id_6, id_6, id_6, id_8, id_8, id_5, id_6, id_8, id_1
  );
  wire id_11;
  id_12(
      1'h0 == id_7, 1, 1, id_6 - 1, 1
  ); id_13(
      id_6
  );
endmodule
