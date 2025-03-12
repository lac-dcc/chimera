// Seed: 522657130
module module_0 (
    input supply1 id_0,
    output tri id_1,
    input wor id_2,
    input tri id_3,
    input tri1 id_4,
    input tri1 id_5,
    output wor id_6,
    input supply1 id_7,
    input wor id_8,
    output uwire id_9
);
  assign id_1 = 1;
  wire  id_11;
  logic id_12;
  assign module_1.id_0 = 0;
  assign id_12 = 1;
endmodule
module module_1 (
    input  tri1 id_0,
    output tri1 id_1,
    input  wor  id_2
);
  wire [-1 : -1] id_4 = id_0;
  logic id_5;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2,
      id_0,
      id_0,
      id_2,
      id_1,
      id_0,
      id_0,
      id_1
  );
endmodule
