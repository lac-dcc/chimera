// Seed: 4225923427
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    input uwire id_2,
    input wand id_3,
    input tri1 id_4,
    input tri1 id_5,
    input supply0 id_6,
    output uwire id_7,
    output tri id_8,
    output wand id_9,
    input supply1 id_10
);
  wire id_12;
  wand id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24 = 1;
  logic [7:0] id_25;
  assign id_21 = id_25[~&1];
endmodule
module module_1 (
    input  wor   id_0,
    input  uwire id_1,
    output wire  id_2,
    output uwire id_3
);
  assign id_2 = id_0;
  module_0(
      id_1, id_0, id_0, id_1, id_1, id_1, id_1, id_3, id_2, id_2, id_1
  );
endmodule
