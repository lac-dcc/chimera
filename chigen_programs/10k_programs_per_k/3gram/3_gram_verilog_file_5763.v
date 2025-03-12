// Seed: 2680796351
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_16 = 32'd89,
    parameter id_18 = 32'd26,
    parameter id_6  = 32'd67
) (
    id_1,
    id_2,
    id_3,
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
    id_14,
    id_15,
    _id_16,
    id_17
);
  inout wire id_17;
  input wire _id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  or primCall (id_3, id_12, id_15, id_7, id_10, id_4, id_14, id_17);
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire _id_6;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_3
  );
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  parameter id_18 = 1;
  logic [7:0] id_19;
  ;
  assign id_3 = id_19[id_16 : 1-id_6!==1];
  defparam id_18.id_18 = id_18;
endmodule
