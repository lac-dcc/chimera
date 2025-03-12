// Seed: 1268267889
module module_0;
  wire id_1;
  union packed {
    logic id_2;
    logic id_3;
  } id_4;
  ;
  assign id_4.id_3 = id_1;
endmodule
module module_1 #(
    parameter id_13 = 32'd55,
    parameter id_14 = 32'd93,
    parameter id_16 = 32'd68,
    parameter id_5  = 32'd56,
    parameter id_8  = 32'd60
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    _id_8[id_13<-1'd0 : id_5],
    id_9,
    id_10[-1'b0==id_5 :-1],
    id_11[1 : 1],
    id_12,
    _id_13,
    _id_14,
    id_15
);
  inout wire id_15;
  input wire _id_14;
  inout wire _id_13;
  inout wire id_12;
  inout logic [7:0] id_11;
  output logic [7:0] id_10;
  output wire id_9;
  output logic [7:0] _id_8;
  inout wire id_7;
  inout wire id_6;
  output wire _id_5;
  inout wire id_4;
  module_0 modCall_1 ();
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire _id_16[id_14  #  (  .  id_8  (  1  )  ) : -1], id_17, id_18;
  wire id_19;
  wire [-1 'b0 : 1  <->  id_16] id_20;
  wire id_21;
  wire id_22, id_23;
endmodule
