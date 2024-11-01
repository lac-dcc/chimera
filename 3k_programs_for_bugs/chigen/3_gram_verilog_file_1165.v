// Seed: 531675726
module module_0;
  wire id_1;
  id_2(
      .id_0(id_3),
      .id_1(id_1),
      .id_2(id_3),
      .id_3(1'b0),
      .id_4(id_3),
      .id_5(id_3),
      .id_6(id_1),
      .id_7(1),
      .id_8(id_4),
      .id_9(id_3)
  );
endmodule
module module_1 (
    input  tri1  id_0,
    output uwire id_1
);
  supply1 id_3 = id_0;
  id_4 :
  assert property (@(posedge 1'h0) 1'b0)
  else id_4 <= 1;
  module_0();
  assign id_4 = 1;
  assign id_3 = 1;
  tri0  id_5;
  uwire id_6;
  assign id_6 = 1;
  assign id_4 = id_0 - id_4;
  specify
    (id_7 => id_8) = (id_0  : 1  : 1, 1 == 1  : id_7  : id_6);
    (id_9 => id_10) = 1;
    $setup(id_11, posedge id_12, id_11);
    (posedge id_13 => (id_14 +: id_9)) = ($display(1, id_12, 1, (id_11 ? 1 : id_14)): id_5  : 1,
                                          ~1);
  endspecify
endmodule
