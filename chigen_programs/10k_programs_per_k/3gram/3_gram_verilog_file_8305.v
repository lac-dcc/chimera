// Seed: 573376506
module module_0 (
    input tri1 id_0,
    input wand id_1,
    output tri0 id_2
    , id_9,
    output wand id_3,
    input tri0 id_4,
    input tri0 id_5,
    input supply0 id_6,
    output wand id_7
);
  assign id_7 = id_4;
  wire id_10;
  always #1;
endmodule
module module_1 (
    output wor id_0,
    input logic id_1#(1),
    input supply0 id_2
    , id_10,
    input wire id_3,
    output logic id_4,
    output logic id_5,
    input supply1 id_6,
    input wand id_7,
    input supply1 id_8
);
  assign id_5 = 0;
  initial id_4 = #id_11 id_10;
  nand (id_5, id_8, id_11, id_3, id_10, id_6, id_2, id_1);
  always_ff @(1 or negedge 1) begin
    id_11 = 1;
  end
  assign id_4 = 1;
  always for (id_11 = id_1; 1; id_0 = 1) id_5 <= 1;
  module_0(
      id_2, id_6, id_0, id_0, id_6, id_2, id_7, id_0
  );
  assign id_10 = id_1;
  assign id_0  = 1;
endmodule
