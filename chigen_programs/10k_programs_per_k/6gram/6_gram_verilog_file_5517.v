// Seed: 3176386492
module module_0 ();
  wire id_1;
  always @(posedge 1) begin : LABEL_0
    release id_1;
  end
  initial begin : LABEL_0
    assign id_1 = 1;
    wait (1);
  end
endmodule
module module_1 (
    input supply1 id_0,
    output uwire id_1,
    output tri1 id_2
);
  assign id_1 = 1;
  module_0 modCall_1 ();
endmodule
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    input tri0 id_2,
    output tri1 id_3,
    input wand id_4,
    input wand id_5,
    input tri0 module_2,
    input supply0 id_7
);
  assign id_3 = id_6 == 1;
  nand primCall (id_1, id_2, id_4, id_5, id_7);
  module_0 modCall_1 ();
endmodule
