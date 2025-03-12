// Seed: 2926803816
module module_0;
  wire [-1 : -1] id_1;
endmodule
module module_1 #(
    parameter id_14 = 32'd76,
    parameter id_3  = 32'd5
) (
    id_1,
    id_2,
    _id_3,
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
    _id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  input wire id_20;
  module_0 modCall_1 ();
  output wire id_19;
  output logic [7:0] id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  input wire _id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire _id_3;
  output reg id_2;
  output wire id_1;
  reg [id_14 : 1 'b0] id_21;
  id_22 :
  assert property (@(posedge id_22) id_21)
  else begin : LABEL_0
    id_21 <= id_4;
    if (-1) id_18[id_3] <= id_10;
    else begin : LABEL_1
      id_2 <= 1;
    end
  end
endmodule
