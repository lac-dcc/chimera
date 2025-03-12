// Seed: 2854726277
module module_0 (
    output logic id_0,
    input  uwire id_1,
    input  tri0  id_2
);
  assign id_0 = id_1;
  always @(negedge 1) begin : LABEL_0
    id_0 = id_2;
  end
endmodule
module module_1 (
    input wor id_0,
    output logic id_1,
    input tri id_2,
    input supply1 id_3,
    output tri1 id_4,
    input wire id_5
);
  always @(id_0 - id_5 or id_3) begin : LABEL_0
    id_1 = id_0;
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input wire id_0,
    output supply1 id_1,
    input wire id_2,
    output supply1 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input tri1 id_6,
    output tri1 id_7,
    input wor id_8,
    output tri1 id_9,
    output logic id_10
);
  final begin : LABEL_0
    if (-1) if (1 & 1) if (-1) id_10 <= id_4;
  end
  wire id_12;
  wire id_13;
  or primCall (id_1, id_6, id_5, id_4, id_2, id_13, id_12, id_0);
  module_0 modCall_1 (
      id_10,
      id_5,
      id_8
  );
  assign modCall_1.id_1 = 0;
  logic [1 : -1  !=  1] id_14;
endmodule
