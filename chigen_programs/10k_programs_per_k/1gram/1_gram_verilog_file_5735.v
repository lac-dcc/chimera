// Seed: 141880705
module module_0;
  assign id_1 = 'b0;
  assign module_2.id_0 = 0;
endmodule
module module_1;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    output wor  id_0,
    input  wire id_1
);
  initial begin : LABEL_0
    if (1 & 1) $display(id_1);
    else id_0 = 1;
  end
  assign id_0 = id_1;
  module_0 modCall_1 ();
endmodule
module module_3 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  tri1  id_4;
  uwire id_5 = 1;
  always #1 begin : LABEL_0
    if (id_5) id_5 = id_1 ? id_5 : id_1;
    else id_2 <= 1'b0 & id_5;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wor id_6, id_7, id_8;
  tri0 id_9, id_10;
  assign id_9 = this == id_6;
  wire  id_11;
  uwire id_12 = id_1 ? $display(1'b0) : 1;
  tri0  id_13 = id_1 - 1'b0;
  assign id_5 = id_4;
  tri0 id_14 = 1;
  always_ff id_2 <= 1'd0 == 1;
endmodule
