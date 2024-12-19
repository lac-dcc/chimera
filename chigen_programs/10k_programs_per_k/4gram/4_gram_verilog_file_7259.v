// Seed: 475914364
module module_0 (
    input  tri1  id_0,
    output uwire id_1,
    input  wand  id_2
);
  wire id_4;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input wand id_0,
    input supply0 id_1,
    input tri id_2,
    output wor id_3,
    input uwire id_4
);
  assign id_3 = 1 ? id_2 - 1 <= id_0 : 1;
  wire id_6;
  always #1 id_3 = id_4;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_2
  );
  id_7(
      .id_0(), .id_1(1), .id_2(id_6), .id_3(1), .id_4(id_6), .id_5(1), .id_6(1), .id_7(), .id_8(1)
  );
  final $display(1'b0 & id_2, 1, 1, 1'b0, (id_2));
endmodule
