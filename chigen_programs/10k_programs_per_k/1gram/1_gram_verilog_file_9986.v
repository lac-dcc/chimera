// Seed: 3758424976
module module_0 #(
    parameter id_2 = 32'd92,
    parameter id_5 = 32'd69
) (
    id_1
);
  inout wire id_1;
  wire _id_2, id_3;
  string id_4 = "";
  logic  _id_5;
  ;
  parameter id_6[id_5  -  -1 'b0 ?  id_2 : id_2 : -1 'b0] = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd26
) (
    id_1[id_5 : 1],
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout reg id_12;
  inout wire id_11;
  module_0 modCall_1 (id_14);
  inout wire id_10;
  inout logic [7:0] id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire _id_5;
  inout logic [7:0] id_4;
  output wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  logic id_17;
  id_18 :
  assert property (@(posedge 1'h0, posedge $realtime or posedge -1 or id_4[1]) id_2)
    #(id_14 != id_9[1] : -1  : 1 && id_7) id_12 = 1'd0;
endmodule
