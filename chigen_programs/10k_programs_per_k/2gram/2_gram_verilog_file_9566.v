// Seed: 3973745886
module module_0 (
    output uwire id_0,
    output tri1  id_1,
    output tri0  id_2,
    input  tri0  id_3
);
  wire id_5;
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    output wand id_2,
    input supply0 id_3
    , id_8,
    input tri1 id_4,
    input wire id_5,
    input tri0 id_6
);
  specify
    (posedge id_9 => (id_10 +: id_8)) = (~1, id_3 & id_6 & id_0 & !1);
    (posedge id_11 => (id_12 +: 1'h0)) = (1, id_5 <-> 1 - 1);
    (id_13 *> id_14) = (id_4, id_3  : id_10  : 1);
    (id_15 => id_16) = 1;
  endspecify
  assign id_2 = 1;
  assign #(id_0 & ~"" - 1) id_10 = 1;
  module_0(
      id_15, id_10, id_14, id_4
  );
endmodule
