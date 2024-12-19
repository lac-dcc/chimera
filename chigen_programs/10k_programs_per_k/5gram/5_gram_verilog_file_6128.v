// Seed: 1375654995
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  assign id_1 = id_2;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    id_1 <= 1;
    #1 id_1 = ~id_1;
  end
  module_0 modCall_1 (
      id_2,
      id_2
  );
  assign modCall_1.id_1 = 0;
  reg id_3;
  always @({1,
    id_2
  }, negedge id_2)
  begin : LABEL_0
    id_3 <= 1;
  end
endmodule
module module_2 (
    output tri   id_0,
    input  tri0  id_1,
    output wire  id_2,
    input  tri   id_3,
    input  tri0  id_4,
    input  wand  id_5,
    input  tri0  id_6,
    input  uwire id_7,
    input  tri0  id_8,
    input  wire  id_9,
    inout  uwire id_10,
    output tri0  id_11
);
  assign id_10 = id_10;
  tri1 id_13 = "" + 1;
  assign id_10 = 1;
  module_0 modCall_1 (
      id_13,
      id_13
  );
  assign modCall_1.id_2 = 0;
endmodule
