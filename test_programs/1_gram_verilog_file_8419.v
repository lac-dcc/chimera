// Seed: 2162080299
module module_0;
  assign id_1 = -1'b0 & -1 ? id_1 : 1;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    output tri0  id_2,
    input  wor   id_3,
    output tri   id_4,
    output tri   id_5
);
  assign id_0 = -1;
  wire id_7;
  initial disable id_8;
  assign id_0 = id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  logic id_9;
  assign id_8 = -1;
  id_10 :
  assert property (@(id_10 or posedge id_9 or posedge id_1) id_10)
    if (1)
      @(negedge id_10 or posedge -1'b0) begin : LABEL_0
        while (1) id_8 <= id_10;
      end
    else $display(!id_10);
  wire id_11;
endmodule
