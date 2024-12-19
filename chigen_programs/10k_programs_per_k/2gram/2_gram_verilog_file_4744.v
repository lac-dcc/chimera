// Seed: 3683854603
module module_0 (
    input supply1 id_0,
    output tri id_1,
    input uwire id_2,
    output tri id_3,
    input uwire id_4,
    input wor id_5,
    input uwire id_6,
    input wor id_7,
    input tri1 id_8
);
  tri id_10;
  assign id_10 = (id_7);
  assign module_1.id_1 = 0;
  always begin : LABEL_0
    if ({1, $display(1 * id_0), id_6, 1'b0, 1}) @(*) id_10 = 1'b0;
  end
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    output tri id_0,
    input tri0 id_1,
    output supply1 id_2,
    output tri1 id_3
);
  assign id_2 = 1;
  id_5(
      .id_0(1)
  );
  module_0 modCall_1 (
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
