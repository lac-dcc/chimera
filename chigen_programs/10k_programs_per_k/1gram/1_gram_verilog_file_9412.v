// Seed: 1605921624
module module_0 #(
    parameter id_11 = 32'd98
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6[1 : 1],
    id_7,
    id_8,
    id_9,
    id_10,
    _id_11,
    id_12,
    id_13[id_11 :-1]
);
  output logic [7:0] id_13;
  inout wire id_12;
  inout wire _id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input logic [7:0] id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_14;
endmodule
module module_1 #(
    parameter id_1  = 32'd70,
    parameter id_13 = 32'd96,
    parameter id_2  = 32'd81,
    parameter id_5  = 32'd5,
    parameter id_7  = 32'd25,
    parameter id_8  = 32'd84
) (
    _id_1,
    _id_2,
    id_3,
    id_4,
    _id_5
);
  input wire _id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  inout wire _id_2;
  output wire _id_1;
  wire id_6;
  ;
  wire [1 : id_5] _id_7;
  parameter id_8 = 1;
  wire [-1 : id_2] id_9;
  for (id_10 = 1; 1'b0; id_3[id_8 : 1] = 1) begin : LABEL_0
    wire id_11;
  end
  wire [id_8 : id_7] id_12, _id_13, id_14;
  wire id_15;
  localparam id_16 = id_8;
  module_0 modCall_1 (
      id_14,
      id_4,
      id_12,
      id_9,
      id_9,
      id_3,
      id_6,
      id_12,
      id_14,
      id_12,
      id_8,
      id_15,
      id_3
  );
  wire id_17[(  -1  ^  {  id_1  {  -1  }  }  )  ?  1  -  1  &&  id_13 : id_13 : -1];
  assign id_13 = id_15;
  wire id_18;
endmodule
