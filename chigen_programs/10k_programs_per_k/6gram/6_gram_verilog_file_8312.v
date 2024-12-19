// Seed: 1472978699
module module_0;
  always @(posedge 1 or posedge 1) begin : LABEL_0
    wait (1);
  end
  assign id_1[1] = 1;
endmodule
module module_0 (
    input wand id_0,
    output tri0 id_1,
    output tri0 module_1,
    output supply1 id_3,
    output tri0 id_4,
    output tri0 id_5,
    output wand id_6,
    output tri0 id_7
);
  always @(1 or 1) begin : LABEL_0
    assume ((1));
  end
  initial begin : LABEL_0
    id_5 = 1;
    fork
      #1;
      begin : LABEL_0
        id_4 = 1;
        id_4 = id_0;
      end
    join
  end
  assign id_3 = 1'b0;
  module_0 modCall_1 ();
endmodule
