// Seed: 3062354966
module module_0 (
    output wor   id_0,
    input  tri   id_1,
    input  tri   id_2,
    output uwire id_3,
    output wor   id_4,
    output uwire id_5
);
  initial begin
    fork
      assign id_4 = id_1 == id_2;
    join_none
  end
endmodule
module module_1 (
    output uwire id_0,
    input wand id_1,
    input uwire id_2,
    output tri id_3,
    input tri1 id_4,
    input wand id_5,
    input supply1 id_6,
    input tri0 id_7,
    input wand id_8,
    input tri1 id_9,
    input tri0 id_10,
    input supply1 id_11
);
  tri id_13, id_14;
  wire id_15;
  wire id_16;
  wire id_17;
  wire id_18;
  assign id_13 = 1;
  module_0(
      id_3, id_2, id_6, id_3, id_3, id_3
  );
endmodule
