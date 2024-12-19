// Seed: 1233799669
module module_0;
  specify
    (id_1 => id_2) = (1  : 1  : 1, 1  : 1  : 1);
    (id_3 => id_4) = (id_3  : 1  : 1'b0, id_3  : 1  : 1);
    $setup(negedge id_5, id_6, 1);
    (id_7 => id_8) = (1  : 1  : 1, id_4);
    if (1'b0) (id_9 => id_10) = (id_5, 1 == 1  : id_1  : 1);
    $setup(posedge id_11, posedge id_12, -id_1 * 1);
    specparam id_13 = id_4;
  endspecify id_14(
      .id_0(id_9)
  );
  assign module_1.type_12 = 0;
  id_15(
      .id_0(id_5), .id_1(1 - 1), .id_2(id_2), .id_3(1), .id_4(id_4), .id_5(1), .id_6(1)
  );
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    input wand id_5,
    input wire id_6
);
  assign id_8 = 1;
  module_0 modCall_1 ();
  tri id_9 = 1;
endmodule
