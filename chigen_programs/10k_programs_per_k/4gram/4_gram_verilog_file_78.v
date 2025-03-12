// Seed: 591588870
module module_0;
  wor id_1 = -1;
  assign module_1._id_16 = 0;
endmodule
module module_1 #(
    parameter id_16 = 32'd44
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  module_0 modCall_1 ();
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always @(posedge id_12 or negedge id_12) begin : LABEL_0
    {id_11, id_6} = id_13 << id_6;
  end
  _id_16 :
  assert property (@(posedge 1) -1)
  else $unsigned(68);
  ;
  wire [ -1  -  id_16 : 1] id_17;
  wire [1 'b0 : -1  ^  -1] id_18;
endmodule
