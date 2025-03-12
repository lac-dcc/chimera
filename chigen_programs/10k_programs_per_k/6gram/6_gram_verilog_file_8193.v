// Seed: 278415817
module module_0 #(
    parameter id_1 = 32'd1,
    parameter id_2 = 32'd90,
    parameter id_3 = 32'd47
);
  wire _id_1;
  ;
  wire _id_2;
  wire _id_3;
  logic [(  id_1  ) : -1] id_4;
  logic [id_3 : id_2] id_5;
  assign id_1 = id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  assign id_1 = 1 ? id_2 : 1 != !id_2;
  assign id_2[-1'd0] = id_3;
  logic [-1 'b0 : 1 'b0] id_4;
  module_0 modCall_1 ();
  always @(1'b0 or posedge -1 + 1) begin : LABEL_0
    {id_2} += id_3;
  end
endmodule
