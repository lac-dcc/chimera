// Seed: 1017055239
module module_0 (
    output wor   id_0,
    input  wor   id_1,
    output uwire id_2,
    input  tri   id_3,
    input  uwire id_4,
    input  tri0  id_5
);
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    input tri id_2,
    output supply0 id_3,
    input uwire id_4,
    output supply0 id_5,
    output wor id_6
);
  wire id_8;
  supply1 id_9;
  assign id_9 = id_4 ? id_2 + 1 : id_0;
  final $display;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_9,
      id_4,
      id_9
  );
endmodule
