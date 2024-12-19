// Seed: 3532963463
module module_0 (
    input tri id_0
);
  integer id_2;
  specify
    (id_3 *> id_4) = 1;
    $setup(negedge id_5, negedge id_6, id_6 - id_0);
  endspecify
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input wand id_2,
    input tri0 id_3
);
  assign id_5 = id_2;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_4 = 0;
  assign id_5 = id_2;
  wire id_6;
  wor  id_7;
  id_8(
      .id_0(1),
      .id_1(1'b0 ? id_7 : id_5),
      .id_2(1'b0),
      .id_3(id_3),
      .id_4(id_2),
      .id_5(id_1 + id_6 - 1),
      .id_6(id_3 & 1),
      .id_7(),
      .id_8(1'b0)
  );
endmodule
