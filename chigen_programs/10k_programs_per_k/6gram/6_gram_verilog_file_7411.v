// Seed: 1432631620
module module_0 (
    output supply1 id_0,
    input tri id_1,
    output uwire id_2,
    input wire id_3,
    output supply1 id_4,
    input tri0 id_5,
    output uwire id_6,
    input tri id_7,
    output tri1 id_8
);
  uwire id_10 = -1;
  assign id_4 = id_5;
  wire id_11;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri1  id_1,
    input  tri0  id_2,
    input  tri1  id_3,
    output tri   id_4,
    output logic id_5
);
  initial begin : LABEL_0
    id_5 = -1;
    id_5 <= id_0;
  end
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_1,
      id_4,
      id_3,
      id_4,
      id_3,
      id_4
  );
  assign modCall_1.id_7 = 0;
endmodule
