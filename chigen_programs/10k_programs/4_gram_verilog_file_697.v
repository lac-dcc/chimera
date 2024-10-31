// Seed: 1474268565
module module_0 (
    output tri0 id_0,
    input  tri0 id_1
);
endmodule
module module_1 (
    input  tri1 id_0,
    output wand id_1,
    input  wand id_2,
    output tri0 id_3
);
  module_0(
      id_3, id_2
  );
  assign id_1 = 1;
  wand id_5;
  tri  id_6 = 1;
  generate
    assign id_3 = id_5 ? id_2 : 1 == id_5;
  endgenerate
endmodule
module module_2 (
    output wand id_0,
    output tri1 id_1,
    input  wand id_2,
    input  tri0 id_3
);
  module_0(
      id_1, id_2
  );
  logic [7:0] id_5 = id_5[""], id_6;
  specify
    (id_7 => id_8) = 1;
    (id_9 => id_10) = (id_2 < id_8  : (1): id_8, 1'b0);
    specparam id_11 = 1'b0;
  endspecify
endmodule
