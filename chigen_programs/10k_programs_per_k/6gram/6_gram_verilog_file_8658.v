// Seed: 3368850387
module module_0 ();
  localparam id_1 = 1;
  wire [-1 : -1 'b0] id_2;
  wire id_3;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input wand id_0,
    input tri  id_1,
    input tri1 id_2,
    input wire id_3
);
  logic id_5;
  module_0 modCall_1 ();
  always @(posedge (1'd0)) begin : LABEL_0
    id_5 = id_1 == (id_5);
    id_5 = 1'd0;
    wait (id_5);
  end
  always @(posedge id_2 or negedge id_5) begin : LABEL_1
    if (1) begin : LABEL_2
      id_5 <= id_0;
    end
  end
endmodule
