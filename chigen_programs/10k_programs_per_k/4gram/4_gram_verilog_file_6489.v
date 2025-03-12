// Seed: 1625114878
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd42,
    parameter id_4 = 32'd36
) (
    id_1,
    id_2,
    _id_3,
    _id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire _id_4;
  output wire _id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_5,
      id_5
  );
  assign id_2 = id_5;
  logic id_7[1 : id_4  +  id_3  -  1];
  ;
endmodule
module module_2 #(
    parameter id_2 = 32'd29,
    parameter id_7 = 32'd2,
    parameter id_8 = 32'd22
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  inout logic [7:0] id_12;
  output wire id_11;
  output wire id_10;
  output tri1 id_9;
  input wire _id_8;
  inout wire _id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire _id_2;
  input wire id_1;
  wire id_13;
  module_0 modCall_1 (
      id_5,
      id_4
  );
  if (1) begin : LABEL_0
    assign id_9 = 1;
    assign id_3 = id_13;
  end else begin : LABEL_1
    assign id_12[id_8+:id_7] = -1'b0;
  end
  logic [1 : id_2] id_14, id_15, id_16 = {id_12}, id_17, id_18, id_19, id_20;
  localparam id_21 = 1;
  assign id_12[-1] = id_12;
  logic id_22;
  ;
endmodule
