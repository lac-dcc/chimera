// Seed: 3681078489
module module_0 (
    input  uwire id_0,
    output tri0  id_1,
    input  tri1  id_2,
    input  wire  id_3,
    input  tri   id_4,
    input  tri1  id_5,
    output tri1  id_6,
    output tri   id_7
);
  parameter id_9 = 1;
  wire id_10;
endmodule
module module_1 (
    input  tri   id_0,
    output tri0  id_1,
    input  wire  id_2,
    output logic id_3,
    output logic id_4,
    input  wand  id_5
);
  initial begin : LABEL_0
    id_3 <= 1;
    id_4 <= -1;
    id_3 <= 1;
  end
  wire id_7;
  wire id_8;
  wire id_9;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_5,
      id_5,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
