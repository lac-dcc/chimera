// Seed: 2511954976
module module_0 ();
  wire id_2;
  assign module_2.id_9   = 0;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    output tri1 id_1
);
  always #1 begin : LABEL_0
    id_0 = 1;
  end
  module_0 modCall_1 ();
endmodule
module module_2 (
    input tri0 id_0,
    input tri id_1,
    input tri id_2,
    output wire id_3,
    input tri0 id_4,
    input supply1 id_5,
    input wand id_6
);
  reg id_8;
  always_comb @(1) id_8 <= id_5 * 1;
  wor id_9;
  module_0 modCall_1 ();
  supply1 id_10 = id_4;
  always @(*) begin : LABEL_0
    id_3 = id_9;
  end
endmodule
