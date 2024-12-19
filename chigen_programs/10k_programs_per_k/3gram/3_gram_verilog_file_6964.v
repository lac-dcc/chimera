// Seed: 3724514006
module module_0;
  assign id_1 = id_1[1];
  generate
    wire id_2 = 1;
  endgenerate
  always_comb @(posedge id_1 or negedge !1'b0) begin : LABEL_0
    if (1'd0) force id_2 = 1;
  end
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  id_5 :
  assert property (@(negedge id_4) $display(1, 1 <-> ""))
  else begin : LABEL_0
    id_4 <= id_3;
    id_5 <= 1;
    id_2 <= id_4++;
  end
  module_0 modCall_1 ();
endmodule
