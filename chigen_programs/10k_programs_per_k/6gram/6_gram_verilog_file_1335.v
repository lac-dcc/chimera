// Seed: 3539815181
module module_0 #(
    parameter id_13 = 32'd88,
    parameter id_6  = 32'd64,
    parameter id_9  = 32'd28
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  string id_5;
  wire _id_6, id_7, id_8, _id_9, id_10, id_11, id_12, _id_13, id_14;
  wire [-1 : id_13] id_15[1 'b0 *  1 : id_9];
  wire id_16;
  ;
  assign id_5 = "";
  wire [1 : id_6] id_17;
  assign id_7 = id_2;
  logic id_18;
  wire  id_19;
endmodule
module module_0 #(
    parameter id_12 = 32'd84,
    parameter id_14 = 32'd27,
    parameter id_2  = 32'd36,
    parameter id_6  = 32'd5
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    id_13,
    _id_14,
    id_15,
    id_16
);
  input wire id_16;
  inout wire id_15;
  input wire _id_14;
  inout wire id_13;
  inout wire _id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_8,
      id_4
  );
  inout reg id_7;
  output wire _id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire _id_2;
  output wire id_1;
  logic [id_12  <<  1 : -1 'b0] module_1;
  ;
  wire id_17;
  generate
    for (id_18 = id_11; id_10; id_7 = 1) begin : LABEL_0
      logic [(  id_2  /  id_14  ) : id_6] id_19;
    end
  endgenerate
endmodule
