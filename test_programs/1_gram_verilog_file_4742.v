// Seed: 2039340019
module module_0;
  generate
    assign id_1 = id_1;
    assign id_2 = id_2;
  endgenerate
  wire id_3, id_4;
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output logic id_1,
    input logic id_2,
    output wand id_3,
    output wor id_4,
    output tri1 id_5
);
  always_latch
    cover (-1)
      @(-1'd0) begin : LABEL_0
        id_5 = -1;
        id_1 <= id_2;
      end
  module_0 modCall_1 ();
endmodule
module module_2 (
    output tri1 id_0
);
  assign id_0 = id_2;
  module_0 modCall_1 ();
  assign id_0 = id_2 !== id_2;
  assign id_0 = id_2;
  assign id_0 = id_2;
  wire id_3;
endprogram
