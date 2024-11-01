// Seed: 259886861
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input tri1 id_4,
    output tri0 id_5,
    input supply1 id_6,
    input uwire id_7,
    output wand id_8,
    input wand id_9,
    output tri0 id_10,
    input wire id_11
);
  logic [7:0] id_13;
  supply0 id_14, id_15;
  assign id_15 = {(id_6), 1};
  assign id_13[1'd0 : 1] = 1;
endmodule
macromodule module_1 (
    output tri id_0,
    input uwire id_1,
    input uwire id_2,
    input supply1 id_3
);
  logic [7:0] id_5;
  module_0(
      id_3, id_3, id_2, id_3, id_3, id_0, id_2, id_1, id_0, id_2, id_0, id_1
  );
  assign id_5[1] = id_3;
  wire id_6;
  wire id_7;
endmodule
