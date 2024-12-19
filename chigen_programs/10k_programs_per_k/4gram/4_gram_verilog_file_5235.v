// Seed: 3384573626
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    input tri id_2
);
  id_4(
      .id_0(1),
      .id_1(1 == id_2),
      .id_2(id_1),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(id_2),
      .id_7(1 == id_1),
      .id_8(),
      .id_9(id_2),
      .id_10("")
  );
endmodule
module module_1 (
    input supply1 id_0,
    output supply1 id_1,
    output tri id_2,
    output supply0 id_3,
    input tri1 id_4
    , id_6
);
  assign id_1 = id_4;
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4
  );
  assign modCall_1.id_2 = 0;
  supply0 id_9;
  id_10 :
  assert property (@(posedge id_4) id_9)
  else $display;
endmodule
