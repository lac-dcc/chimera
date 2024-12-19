// Seed: 272267662
module module_0 (
    input  wor   id_0,
    input  tri0  id_1,
    input  wand  id_2,
    input  wire  id_3,
    output uwire id_4,
    output wand  id_5,
    input  wand  id_6
);
  uwire id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16 = id_11 - id_3;
  assign module_1.id_5 = 0;
  wire id_17;
  wire id_18;
  id_19(
      .id_0(id_12), .product(1 == 1)
  );
  wire id_20, id_21;
  wire id_22;
  assign id_21 = id_3;
endmodule
module module_1 (
    input logic id_0,
    input supply1 id_1,
    input tri id_2
);
  wire id_4 = 1;
  assign id_4 = id_1;
  always @(negedge id_0) begin : LABEL_0
    wait (1);
  end
  reg id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4,
      id_2
  );
  final begin : LABEL_0
    id_5 <= 1;
  end
endmodule
