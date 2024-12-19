// Seed: 2433528663
macromodule module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_4(
      .id_0(1),
      .id_1(0),
      .id_2(1),
      .id_3(id_5),
      .id_4(),
      .id_5(id_1),
      .id_6(1),
      .id_7(1),
      .id_8(~1),
      .id_9(id_3)
  );
endmodule
module module_1 (
    output logic id_0,
    output wor id_1,
    input supply0 id_2,
    input wor id_3,
    input uwire id_4,
    input wand id_5
);
  id_7 :
  assert property (@(posedge 1) 1'h0)
  else id_0 <= 1;
  nand primCall (id_0, id_3, id_2);
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7
  );
endmodule
