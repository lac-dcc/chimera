// Seed: 2614922668
module module_0 (
    input  tri0 id_0,
    input  tri  id_1,
    output wire id_2,
    output wor  id_3,
    input  wor  id_4
);
  assign id_3 = id_1 != id_4;
  assign module_1.type_0 = 0;
  initial $display(1, 1, id_4, id_0, 1, 1);
endmodule
module module_1 (
    input  wire  id_0,
    output logic id_1,
    input  wand  id_2
);
  final begin : LABEL_0
    id_1 <= ~&id_0;
  end
  tri id_4, id_5, id_6;
  pullup (id_2, (id_5++));
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_4,
      id_0
  );
  wire id_7;
  assign id_5 = id_6;
  wire id_8;
endmodule
