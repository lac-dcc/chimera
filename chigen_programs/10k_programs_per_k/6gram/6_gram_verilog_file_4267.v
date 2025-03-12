// Seed: 1971790597
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input tri0 id_2,
    input supply1 id_3,
    output wor id_4,
    input wand id_5,
    input supply0 id_6,
    input tri1 id_7,
    input uwire id_8,
    input supply1 id_9,
    output supply0 id_10,
    output tri1 id_11
);
  wire  id_13;
  logic id_14;
  ;
  wire id_15;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    input supply0 id_2,
    output tri0 id_3
);
  localparam id_5 = -1, id_6 = -1'd0, id_7 = id_2 == (id_7 && id_6 || id_7);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_2,
      id_3,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_3,
      id_1
  );
  assign modCall_1.id_9 = 0;
endmodule
