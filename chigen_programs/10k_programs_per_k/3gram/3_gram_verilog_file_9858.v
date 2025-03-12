// Seed: 1791309597
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  assign module_2.id_5 = 0;
  output wire id_2;
  input wire id_1;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2
);
  output logic [7:0] id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 #(
    parameter id_18 = 32'd40,
    parameter id_3  = 32'd21,
    parameter id_5  = 32'd26,
    parameter id_9  = 32'd97
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10
);
  inout wire id_10;
  output wire _id_9;
  output wire id_8;
  output tri id_7;
  input wire id_6;
  inout wire _id_5;
  inout wire id_4;
  inout wire _id_3;
  inout wire id_2;
  inout wire id_1;
  wire [1 : id_5] id_11, id_12, id_13, id_14, id_15, id_16;
  logic [id_3 : (  1 'b0 )] id_17;
  ;
  wire _id_18;
  wire id_19, id_20;
  logic id_21[-1 'd0 : id_9  ?  1 : 1] = id_6 - 1;
  module_0 modCall_1 (
      id_4,
      id_12,
      id_2
  );
  assign id_2 = id_13;
  assign id_7 = -1 & id_17[-1+:1];
  wire [id_5 : id_18] id_22;
endmodule
