// Seed: 3176620887
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
    id_15
);
  output wire id_15;
  inout wire id_14;
  inout tri id_13;
  input wire id_12;
  inout tri0 id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign {id_6 | (-1), id_13} = id_12;
  assign id_11 = 1;
  final $signed(24);
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd26,
    parameter id_8 = 32'd40
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire _id_3;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_4,
      id_5,
      id_4,
      id_2,
      id_5,
      id_1,
      id_5,
      id_2,
      id_5,
      id_5,
      id_5
  );
  assign modCall_1.id_13 = 0;
  input wire id_2;
  input wire id_1;
  for (id_6 = (1); -1'b0; ++id_4) begin : LABEL_0
    logic id_7 = 1;
  end
  localparam id_8 = -1;
  logic [1 : 1 'b0 ==  id_3  +  1 'b0] id_9, id_10;
  wire id_11;
  logic [id_8 : -1] id_12;
  ;
  logic \id_13 ;
  ;
  wire id_14;
  ;
endmodule
