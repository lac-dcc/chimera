// Seed: 3983766125
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_4 = 1;
  initial begin : LABEL_0
    if (1 < 1'd0)
      assume (1'b0);
      else begin : LABEL_0
        if (id_3) id_4 = (1);
      end
  end
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    output wand id_0
);
  always @(posedge ("") or negedge 1'b0) id_0 = 1;
  logic [7:0] id_3;
  always @(posedge 1) begin : LABEL_0
    fork
      id_4(id_3[1'b0 : 1'h0], id_2[1]);
      id_5;
    join_any
    #1;
  end
  module_0 modCall_1 (
      id_4,
      id_3,
      id_5
  );
endmodule
