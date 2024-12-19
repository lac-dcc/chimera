// Seed: 1097586961
module module_0 (
    input uwire id_0,
    input uwire id_1,
    output uwire id_2,
    output wire id_3,
    output tri id_4,
    output wire id_5,
    input uwire id_6,
    input uwire id_7,
    input supply0 id_8,
    output wand id_9,
    input tri id_10,
    input wand id_11,
    output tri1 id_12,
    output wire id_13
);
  wire id_15;
  wand id_16 = id_0;
  wire id_17;
  integer id_18 (
      .id_0(1'd0),
      .id_1(id_8),
      .id_2(id_6),
      .id_3(id_2),
      .id_4(id_12),
      .id_5(1),
      .id_6(id_6),
      .id_7()
  );
  id_19 :
  assert property (@(negedge id_1) (0 ? id_0 : 1))
  else $display(id_8);
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    input wor id_2
);
  assign id_0 = id_1 && id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
