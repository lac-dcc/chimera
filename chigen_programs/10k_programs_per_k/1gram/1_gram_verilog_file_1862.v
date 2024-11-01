// Seed: 2173423502
module module_0;
  tri0 id_2, id_3;
  assign id_1 = 1;
  uwire id_4;
  id_5(
      .id_0((id_6 - id_4 - id_2)),
      .id_1(1),
      .id_2(id_1 & id_3),
      .id_3(id_1),
      .id_4(id_4),
      .id_5(id_3.id_6),
      .id_6(id_2)
  );
  wire id_7;
  wire id_8;
  assign id_3 = 1;
endmodule
module module_1 (
    output uwire   id_0,
    input  supply1 id_1
);
  assign id_0 = "" << id_1;
  id_3 :
  assert property (@(posedge 1'b0) id_3 ? 1 : id_1) id_0 = 1;
  module_0();
endmodule
