// Seed: 2018105641
module module_0 (
    output tri id_0,
    output wor id_1,
    output tri1 id_2,
    output supply0 id_3,
    input wand id_4,
    input uwire id_5,
    input supply0 id_6,
    input wire id_7,
    output tri1 id_8,
    input supply1 id_9,
    output tri1 id_10,
    output uwire id_11,
    output supply1 id_12
);
  wire id_14;
endmodule
module module_1 (
    input uwire id_0,
    output supply1 id_1,
    output uwire id_2,
    output tri id_3,
    output wand id_4
);
  id_6 :
  assert property (@(negedge 1'h0 or id_0) 1)
  else;
  generate
    id_7(
        .id_0(1 * 1), .id_1(!id_6)
    );
  endgenerate
  module_0(
      id_3, id_6, id_6, id_2, id_6, id_0, id_6, id_0, id_2, id_6, id_3, id_2, id_4
  );
  assign id_6 = id_0;
endmodule
