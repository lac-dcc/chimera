// Seed: 3576027503
module module_0 (
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
    id_15,
    id_16
);
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign module_1.id_1 = 0;
  localparam id_17 = -1;
  wire id_18;
  wire id_19;
  wire id_20;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd24,
    parameter id_3 = 32'd95
) (
    _id_1,
    id_2
);
  output wire id_2;
  inout wire _id_1;
  wire [id_1 : id_1  +  -1] _id_3 = -1;
  logic [7:0] id_4;
  assign id_4[id_1] = id_3 ? id_4 : -1'b0;
  logic [id_3 : 1 'b0] id_5 = id_4;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_2,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_2,
      id_5,
      id_5,
      id_5,
      id_5
  );
endmodule
