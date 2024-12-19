// Seed: 408512907
module module_0 (
    output uwire id_0,
    input tri0 module_0,
    input wand id_2,
    input wor id_3,
    input tri0 id_4,
    input uwire id_5,
    input tri1 id_6,
    input supply0 id_7,
    output tri0 id_8,
    output tri id_9
);
  wire id_11;
endmodule
module module_1 (
    input  wand id_0,
    output tri0 id_1,
    output wand id_2
);
  reg id_4;
  reg id_5;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.id_6 = 0;
  assign id_1 = id_0 == id_4;
  always @(*) begin : LABEL_0
    if (1'h0) if (id_5) id_5 <= id_0 == 1;
  end
  initial begin : LABEL_0
    id_4 = id_5;
    $display;
  end
endmodule
