// Seed: 1309515691
module module_0 #(
    parameter id_22 = 32'd27,
    parameter id_3  = 32'd90,
    parameter id_6  = 32'd59
) (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  localparam id_3 = 1;
  wire id_4, id_5, _id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16;
  parameter id_17 = 1, id_18 = -1;
  wire [id_6  +  id_3 : 1] id_19;
  assign module_1.id_3 = 0;
  wire id_20;
  wire id_21;
  wire _id_22;
  ;
  logic [7:0] id_23;
  integer id_24;
  ;
  assign id_23[1'b0-id_22] = 1'b0;
endmodule
module module_1 #(
    parameter id_3 = 32'd25
) (
    output wor  id_0,
    input  tri0 id_1,
    input  tri0 id_2,
    input  tri0 _id_3
);
  logic [-1 : id_3  -  1 'b0] id_5;
  wire id_6;
  wire id_7;
  logic id_8 = 1;
  module_0 modCall_1 (
      id_5,
      id_7
  );
  logic [7:0] id_9;
  reg id_10;
  always
    if (1'b0)
      if (-1) id_10 <= -1'b0;
      else begin : LABEL_0
        #1;
      end
  assign id_0 = id_9[-1];
  wire id_11;
endmodule
