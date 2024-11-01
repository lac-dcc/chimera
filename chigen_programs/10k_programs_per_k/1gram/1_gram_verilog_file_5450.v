// Seed: 905712800
module module_0 (
    output supply0 id_0,
    output wand id_1,
    output wor id_2,
    input supply1 id_3,
    output tri id_4,
    input supply1 id_5,
    output wand id_6,
    input uwire id_7,
    output tri0 id_8
);
  assign id_6 = 1;
  supply1 id_10;
  assign id_10 = 1'b0;
  wire id_11 = id_11(id_3, id_7);
  wand id_12 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    output tri id_1
    , id_14,
    input wor id_2,
    output wire id_3,
    input logic id_4,
    input supply0 id_5,
    input logic id_6,
    output supply1 id_7,
    input wor id_8,
    input tri id_9,
    input uwire id_10,
    output tri0 id_11,
    output wand id_12
);
  logic id_15, id_16, id_17;
  always #1 id_15 <= id_6;
  and (id_1, id_6, id_16, id_14, id_9, id_5, id_4, id_15, id_10);
  module_0(
      id_0, id_11, id_3, id_5, id_1, id_5, id_0, id_9, id_1
  );
  assign id_15 = $display(1'b0, 1, id_4, id_16);
endmodule
