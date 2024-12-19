// Seed: 2505903297
module module_0 (
    input wor id_0,
    output tri0 id_1,
    input supply0 id_2,
    input tri id_3
);
  supply1 id_5;
  assign id_1 = id_5;
  wire id_6;
  wire id_7;
  final begin : LABEL_0
    id_1 += 1;
  end
endmodule
module module_1 (
    output wand  id_0,
    output wire  id_1,
    output logic id_2,
    output tri   id_3,
    input  tri   id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_4
  );
  assign modCall_1.id_3 = 0;
  wire id_7;
  id_8 :
  assert property (@(id_8) 1 ? id_8 : 1)
  else id_2 <= id_8;
endmodule
