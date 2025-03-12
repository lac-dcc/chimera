// Seed: 830672002
module module_0;
  wire id_1;
  wire id_2;
  always @(posedge id_1) begin : LABEL_0
    disable id_3;
  end
endmodule
module module_1 #(
    parameter id_2 = 32'd28
) (
    id_1,
    _id_2,
    id_3,
    id_4
);
  output wire id_4;
  input logic [7:0] id_3;
  module_0 modCall_1 ();
  input wire _id_2;
  input wire id_1;
  logic [7:0] id_5;
  bit [1  &  1 : id_2] id_6, id_7;
  always @(posedge id_6 - $realtime) begin : LABEL_0
    if (1) id_5[-1'b0] <= id_1 ? !id_6 : (id_3);
    else begin : LABEL_1
      $signed(87);
      ;
      id_7 <= id_5;
    end
  end
  wire [-1 : 1] id_8;
endmodule
