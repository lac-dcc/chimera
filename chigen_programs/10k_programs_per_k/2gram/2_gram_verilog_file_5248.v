// Seed: 1174424395
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
  uwire id_9;
  wire [-1 'b0 : 1 'b0] id_10;
  wire id_11 = id_1;
  assign id_9 = -1;
  logic [1 : -1] id_12;
  wire  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ;
  assign id_19 = id_2;
  assign id_2  = id_18;
endmodule
module module_1 #(
    parameter id_8 = 32'd18
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  localparam id_8 = 1;
  parameter id_9 = 1;
  if (id_8) begin : LABEL_0
    defparam id_8.id_8 = id_8;
  end
  if (id_8) begin : LABEL_1
    wire id_10;
    ;
  end
  module_0 modCall_1 (
      id_4,
      id_9,
      id_2,
      id_9,
      id_6,
      id_4,
      id_7
  );
  assign modCall_1.id_9 = 0;
  wire id_11;
  assign id_7 = -1;
  wire id_12;
  assign id_1 = id_12;
endmodule
