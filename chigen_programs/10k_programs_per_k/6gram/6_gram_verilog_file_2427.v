// Seed: 653527781
module module_0;
  always @(posedge -1'b0) #1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout logic [7:0] id_10;
  output reg id_9;
  output reg id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  assign id_9 = -1;
  always @(id_4 == id_5 or posedge -1) begin : LABEL_0
    id_10 += ~id_5;
    id_8 <= id_10;
    id_9 <= id_10[1];
  end
endmodule
