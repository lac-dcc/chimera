// Seed: 74532596
module module_0;
  always_latch #1;
  id_1(
      .id_0(id_2 << 1'd0), .id_1(id_3), .id_2(1), .id_3(1)
  );
  assign module_2.type_2 = 0;
endmodule
module module_1 ();
  integer id_2 (.id_0(1));
  id_4(
      .id_0(1)
  );
  module_0 modCall_1 ();
endmodule
module module_2 (
    input supply0 id_0,
    input wand id_1
    , id_16,
    input uwire id_2,
    input wor id_3,
    output tri1 id_4,
    input uwire id_5,
    output tri1 id_6,
    input tri id_7,
    input wand id_8,
    input wand id_9,
    input tri id_10,
    output wand id_11,
    output tri1 id_12,
    input tri1 id_13,
    input wor id_14
);
  wire id_17;
  xnor primCall (id_11, id_13, id_14, id_16, id_17, id_2, id_3, id_5, id_7, id_8, id_9);
  module_0 modCall_1 ();
endmodule
