// Seed: 1969161333
module module_0;
  generate
    for (id_1 = -1; id_1; id_1 = -1) begin : LABEL_0
      always @((id_1)) id_1 <= id_1 < 1;
    end
  endgenerate
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd31,
    parameter id_4 = 32'd28,
    parameter id_8 = 32'd57,
    parameter id_9 = 32'd4
) (
    id_1,
    id_2,
    _id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    _id_9
);
  input wire _id_9;
  module_0 modCall_1 ();
  inout wire _id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire _id_4;
  input wire _id_3;
  output logic [7:0] id_2;
  output logic [7:0] id_1;
  assign id_1[id_9 : 1] = id_7 == 1;
  logic [7:0] id_10;
  logic [id_9  ==  id_8 : id_3] id_11;
  assign id_10[-1 :-1] = -1;
  assign id_2[-1'd0==id_4<id_3] = id_10;
endmodule
