// Seed: 1342304683
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    input wor id_2,
    input supply0 id_3,
    input tri id_4,
    input supply1 id_5,
    output tri id_6,
    output supply1 id_7,
    input wand id_8,
    input supply1 id_9,
    output uwire id_10,
    input wor id_11,
    input wire id_12,
    input uwire id_13,
    output supply0 id_14
);
  wire id_16, id_17, id_18 = id_17, id_19;
  wire id_20;
  wire id_21;
  wire id_22;
  assign id_7 = {1};
  wire id_23, id_24;
endmodule
module module_1 (
    inout  tri  id_0,
    input  tri1 id_1,
    output wand id_2
);
  assign id_2 = ~id_0;
  supply1 id_4;
  always_latch #1 id_4 = id_0;
  module_0(
      id_2, id_0, id_4, id_4, id_4, id_4, id_2, id_4, id_4, id_0, id_0, id_1, id_1, id_4, id_0
  );
  wire id_5, id_6, id_7;
endmodule
