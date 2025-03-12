// Seed: 3345555761
module module_0;
  reg id_1;
  assign id_1 = 1;
  always @(posedge id_1 or 1) id_1 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd54,
    parameter id_3 = 32'd44
) (
    id_1,
    _id_2
);
  input wire _id_2;
  output tri0 id_1;
  wire _id_3;
  logic [7:0][id_2 : ""] id_4;
  assign id_1 = 1;
  assign id_4 = id_2;
  always_latch @(posedge 1 or negedge (id_2)) begin : LABEL_0
    id_4[~id_2-:id_2] <= (id_4);
  end
  wire [id_3 : 1 'b0] id_5;
  wire id_6;
  ;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
