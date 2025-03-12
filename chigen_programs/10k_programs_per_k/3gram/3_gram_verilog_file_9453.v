// Seed: 794085227
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
  inout wire id_16;
  inout tri id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_15 = (1);
endmodule
module module_1 #(
    parameter id_12 = 32'd60
) (
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
    id_11
);
  output wire id_11;
  inout reg id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire [1 : -1] _id_12;
  always @(1'b0 or negedge id_8) begin : LABEL_0
    id_10 <= id_1;
  end
  wire id_13;
  logic [1 : (  {  id_12  {  id_12  }  }  )] id_14;
  module_0 modCall_1 (
      id_13,
      id_5,
      id_6,
      id_5,
      id_13,
      id_14,
      id_9,
      id_14,
      id_6,
      id_5,
      id_5,
      id_1,
      id_6,
      id_5,
      id_5,
      id_14
  );
  assign id_11 = id_7;
  wire id_15;
  struct packed {
    logic [( "" ) : -1] id_16;
    id_17 id_18;
  } id_19;
endmodule
