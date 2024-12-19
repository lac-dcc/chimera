// Seed: 919171020
module module_0 (
    output tri1 id_0,
    output wand id_1
);
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output wire  id_0,
    input  tri0  id_1,
    input  tri1  id_2,
    output uwire id_3
);
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_3,
      id_0
  );
  initial begin : LABEL_0
    id_5(1);
    if (1 == 1) begin : LABEL_0
      id_3 = 1;
    end
  end
  wire id_6;
  logic [7:0] id_7;
  uwire id_8;
  wire id_9;
  assign id_8 = id_7[1] ? 1 : 1 - 1'b0 ? 1 : 1'b0;
endmodule
