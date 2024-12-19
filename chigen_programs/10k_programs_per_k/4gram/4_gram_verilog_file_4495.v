// Seed: 3057522241
module module_0;
  assign id_1 = 1;
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    input logic id_2,
    input logic id_3,
    input supply1 id_4,
    input logic id_5,
    input supply0 id_6
);
  always @(posedge id_1 or posedge 1'b0) begin : LABEL_0
    id_8 <= #1 1;
    id_8 <= id_5;
  end
  always_ff @(1'd0 or 1) begin : LABEL_0
    id_9 <= id_2;
    id_9 <= 1;
  end
  assign id_10 = id_3;
  assign id_10 = id_5;
  id_11 :
  assert property (@(posedge 1) id_3)
  else $display(1 ^ id_2 - 1'b0);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
