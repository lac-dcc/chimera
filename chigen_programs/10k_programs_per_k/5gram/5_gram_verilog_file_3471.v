// Seed: 715709007
module module_0 (
    output uwire id_0,
    input  tri0  id_1
);
  id_3 :
  assert property (@(posedge id_1 - 1'b0) 1)
  else $display(1 <= 1);
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  logic id_0,
    output wor   id_1,
    input  wor   id_2,
    input  wire  id_3,
    output tri   id_4,
    output wor   id_5
);
  logic id_7;
  module_0 modCall_1 (
      id_4,
      id_2
  );
  always @(negedge id_0) begin : LABEL_0
    wait (id_7);
    id_7 <= id_7;
  end
  initial begin : LABEL_0
    wait (1'd0);
  end
endmodule
