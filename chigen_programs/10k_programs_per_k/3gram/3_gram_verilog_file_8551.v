// Seed: 3689776182
module module_0 (
    input tri id_0,
    output supply1 id_1,
    input supply1 id_2,
    input supply0 id_3,
    output wor id_4,
    output wire id_5,
    input wor id_6
);
  tri id_8;
  assign id_8 = 1;
  assign module_1.id_1 = 0;
  id_9(
      .id_0(id_0), .id_1(id_5), .id_2(id_0), .id_3(id_6)
  );
  wire id_10;
endmodule
module module_1 (
    input tri1 id_0,
    output tri1 id_1,
    input wor id_2,
    input wor id_3,
    output uwire id_4,
    input tri1 id_5,
    output supply1 id_6,
    output supply1 id_7,
    output logic id_8
);
  assign id_6 = id_0;
  final begin : LABEL_0
    id_6 = 1;
    id_8 <= 1;
  end
  nand primCall (id_6, id_5, id_0, id_3, id_2);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_0,
      id_4,
      id_1,
      id_5
  );
endmodule
