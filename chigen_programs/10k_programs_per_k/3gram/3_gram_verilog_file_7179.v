// Seed: 2157976802
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout tri0 id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4 = -1;
  wire id_5, id_6, id_7, id_8, id_9, id_10;
endmodule
module module_1 #(
    parameter id_15 = 32'd44,
    parameter id_3  = 32'd56
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
    id_14,
    _id_15,
    id_16,
    id_17
);
  inout wire id_17;
  inout wire id_16;
  input wire _id_15;
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  output reg id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire _id_3;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_12,
      id_14
  );
  output wire id_2;
  input wire id_1;
  assign id_10 = id_7;
  id_18 :
  assert property (@(negedge id_18[id_3 : 1'b0]) id_15)
  else id_10 = 1;
  logic id_19;
  ;
  wire [id_15 : (  id_3  )] id_20;
endmodule
