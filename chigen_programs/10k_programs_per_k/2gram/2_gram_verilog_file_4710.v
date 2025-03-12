// Seed: 207679028
module module_0 (
    id_1
);
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_0 = 32'd29,
    parameter id_1 = 32'd36,
    parameter id_2 = 32'd60
) (
    input wire  _id_0,
    input tri1  _id_1,
    input uwire _id_2
);
  struct packed {
    logic [-1 : id_1] id_4;
    logic id_5;
  } [id_1 : id_1  -  id_0] id_6;
  ;
  generate
    wire [1 : id_2] id_7;
  endgenerate
  wire [{  -1  ,  -1 'b0 } : 1] id_8;
  wire id_9;
  wire id_10[-1 'h0 : -1];
  wire id_11;
  assign id_6 = id_8;
  always_comb begin : LABEL_0
    id_6.id_5 = id_7;
  end
  assign id_11 = id_2;
  module_0 modCall_1 (id_4);
  parameter id_12 = 1;
  integer [id_0 : 1 'd0] id_13;
endmodule
