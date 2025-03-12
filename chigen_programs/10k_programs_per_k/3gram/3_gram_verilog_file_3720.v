// Seed: 84058020
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5 = id_3;
endmodule
module module_1 #(
    parameter id_14 = 32'd98,
    parameter id_18 = 32'd30,
    parameter id_3  = 32'd63,
    parameter id_6  = 32'd47
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    _id_14,
    id_15
);
  inout wire id_15;
  inout wire _id_14;
  input wire id_13;
  inout wire id_12;
  inout logic [7:0] id_11;
  output wire id_10;
  inout wire id_9;
  and primCall (id_4, id_8, id_12, id_5, id_11, id_9, id_13, id_2, id_15);
  input wire id_8;
  output wire id_7;
  output wire _id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_8,
      id_4
  );
  inout wire id_4;
  input wire _id_3;
  inout wire id_2;
  output wire id_1;
  wire id_16;
  always @(posedge id_2);
  logic [id_14 : -1  &  id_6] id_17;
  wor _id_18 = -1'b0;
  assign id_7  = id_11[1 : {id_3|1'b0<1'b0, (1-id_18)}];
  assign id_11 = id_18;
endmodule
