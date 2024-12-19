// Seed: 2356667764
module module_0 (
    output uwire id_0,
    input wire id_1
    , id_9,
    output tri1 id_2,
    input wand id_3,
    input supply0 id_4,
    input supply0 id_5,
    output tri0 id_6,
    input wor id_7
);
  int id_10 = id_4;
  id_11(
      .id_0(id_10), .id_1(-1), .id_2("" && id_4), .id_3(1)
  );
  wire id_12;
  wire id_13;
  always cover (1) $display;
endmodule
module module_1 (
    output wor id_0,
    input uwire id_1,
    input tri1 id_2,
    output supply0 id_3,
    output uwire id_4,
    output supply0 id_5,
    input tri1 id_6,
    output tri0 id_7,
    output tri id_8,
    input tri id_9,
    output tri0 id_10,
    output uwire id_11,
    output wor id_12,
    input tri id_13,
    input wand id_14,
    input tri0 id_15
    , id_21,
    input tri id_16,
    output supply0 id_17,
    input tri id_18,
    input tri1 id_19
);
  xnor primCall (id_12, id_15, id_14, id_19, id_16, id_6, id_2, id_21, id_1, id_13, id_9);
  module_0 modCall_1 (
      id_0,
      id_15,
      id_7,
      id_19,
      id_19,
      id_18,
      id_4,
      id_18
  );
  assign modCall_1.id_6 = 0;
endmodule
