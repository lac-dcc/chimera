// Seed: 2224520056
module module_0 (
    output tri0 id_0
);
  wire id_2;
  wire id_4, id_5;
  assign id_3 = 1;
  initial disable id_6;
  generate
    wire id_7;
    assign id_6 = id_3;
    wire id_8;
  endgenerate
  wire id_9;
  wire id_10;
  assign id_5 = id_8;
  integer id_11 = 1;
endmodule
module module_1 (
    input supply1 id_0
);
  tri  id_2 = id_0;
  wire id_3;
  module_0 modCall_1 (id_2);
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    output uwire id_0,
    input  logic id_1
);
  logic id_3, id_4, id_5 = id_5;
  always_latch id_4 <= 1'b0;
  initial begin : LABEL_0
    if (1) $display(1, (id_1), id_5, id_3);
    $display;
  end
  module_0 modCall_1 (id_0);
  assign id_4 = id_4;
  assign id_3 = id_3;
  wire id_6;
  wire id_7;
endmodule
