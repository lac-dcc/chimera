// Seed: 3098558998
module module_0 ();
  logic id_1;
  assign id_1 = 1;
  wire id_2 = id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd90,
    parameter id_4 = 32'd54
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire _id_4;
  inout wire id_3;
  module_0 modCall_1 ();
  input wire _id_2;
  nand primCall (id_1, id_3, id_5, id_6);
  inout wire id_1;
  logic [-1  +  id_4 : id_2] id_7;
  always @(posedge 1'd0 or negedge (id_7)) begin : LABEL_0
    if (-1 - -1'b0) begin : LABEL_1
      wait (~id_4);
    end
  end
endmodule
