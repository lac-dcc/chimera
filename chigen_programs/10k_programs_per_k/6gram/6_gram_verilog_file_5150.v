// Seed: 3435996144
module module_0 (
    output supply1 id_0,
    output supply0 id_1
);
  assign id_0 = id_3;
  assign module_2.type_0 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output wor id_1,
    input supply1 id_2,
    input tri1 id_3,
    input wor id_4,
    output tri0 id_5
);
  wire id_7;
  assign id_1 = 1;
  always begin : LABEL_0
    if (id_4) assume (1);
    $display(id_7);
    disable id_8;
  end
  module_0 modCall_1 (
      id_1,
      id_5
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    input  tri0 id_0,
    output wor  id_1,
    output tri0 id_2
);
  id_4(
      .id_0(1),
      .id_1(id_0 == 1'b0),
      .id_2(~id_2),
      .id_3(1),
      .id_4(),
      .id_5(1),
      .id_6(id_1),
      .id_7(1)
  );
  module_0 modCall_1 (
      id_2,
      id_2
  );
  wire id_5;
endmodule
