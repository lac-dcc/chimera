// Seed: 4142688630
macromodule module_0 (
    input tri0 id_0,
    input wand id_1
    , id_16,
    output uwire id_2,
    input tri0 id_3,
    input tri0 id_4,
    input wor id_5,
    output wand id_6,
    output tri0 id_7,
    output wire id_8,
    input tri id_9,
    output wor id_10,
    input tri1 id_11,
    output supply0 id_12,
    input tri0 id_13,
    input tri0 id_14
);
  always_latch @(~1) begin
    `define pp_17 0
    $display;
  end
  wire id_18;
endmodule
module module_1 (
    output wand id_0,
    input supply0 id_1,
    input wire id_2,
    input wor id_3,
    output wire id_4,
    input tri0 id_5,
    output supply1 id_6,
    input wand id_7,
    input tri id_8,
    input tri1 id_9
);
  supply1 id_11 = 1;
  assign id_6 = id_7 + 1'b0;
  assign id_0 = 1'b0;
  tri1 id_12;
  module_0(
      id_5, id_3, id_4, id_5, id_1, id_5, id_4, id_0, id_12, id_8, id_0, id_1, id_12, id_7, id_3
  );
  assign id_12 = {id_5{1}};
  wire id_13;
endmodule
