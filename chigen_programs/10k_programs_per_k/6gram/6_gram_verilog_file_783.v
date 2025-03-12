// Seed: 764394496
module module_0 ();
  logic [-1 'h0 : 1] id_1;
  ;
endmodule
module module_1 #(
    parameter id_10 = 32'd29
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout reg id_8;
  output logic [7:0] id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  module_0 modCall_1 ();
  logic [-1 : 1] _id_10;
  always @(posedge 1) begin : LABEL_0
    #(id_2) id_8 = 1;
  end
  always @(id_10) begin : LABEL_1
    id_7[id_10!=1] <= id_9;
  end
endmodule
