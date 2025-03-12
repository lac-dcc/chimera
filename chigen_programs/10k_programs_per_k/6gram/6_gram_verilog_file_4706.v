// Seed: 1009572553
module module_0;
  logic id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd2
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output reg id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  xnor primCall (id_10, id_5, id_6, id_7, id_8);
  input wire _id_1;
  module_0 modCall_1 ();
  wire [id_1 : -1] id_12;
  localparam id_13 = 1;
  assign id_3 = id_7;
  always @(-1'b0 or posedge id_12) begin : LABEL_0
    cover (id_8);
    id_11 <= 1'b0;
  end
endmodule
