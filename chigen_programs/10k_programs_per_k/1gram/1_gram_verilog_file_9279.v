// Seed: 477959103
module module_0 #(
    parameter id_12 = 32'd18,
    parameter id_23 = 32'd28
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9[id_12 :-1],
    id_10,
    id_11,
    _id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17[1'b0 :-1'b0],
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    _id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28
);
  output wire id_28;
  output tri1 id_27;
  inout wire id_26;
  input wire id_25;
  input wire id_24;
  output wire _id_23;
  assign module_1.id_6 = 0;
  output wire id_22;
  output wire id_21;
  output wire id_20;
  output wire id_19;
  input wire id_18;
  input logic [7:0] id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire _id_12;
  input wire id_11;
  output wire id_10;
  input logic [7:0] id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  integer id_29[id_23 : 1];
  assign id_28 = ~id_7;
  assign id_27 = 1;
  assign id_28 = id_9;
endmodule
module module_1 #(
    parameter id_6 = 32'd82,
    parameter id_7 = 32'd21
) (
    id_1,
    id_2
);
  inout logic [7:0] id_2;
  output wire id_1;
  generate
    begin : LABEL_0
      begin : LABEL_1
        begin : LABEL_2
          wire id_3;
        end
        assign id_2[1 :-1][1 : 1] = ~-1;
      end
    end
  endgenerate
  wire id_4;
  localparam id_5 = 1;
  parameter id_6 = -1;
  logic [7:0][id_6][1] _id_7;
  ;
  logic id_8;
  ;
  module_0 modCall_1 (
      id_4,
      id_8,
      id_4,
      id_5,
      id_4,
      id_5,
      id_5,
      id_8,
      id_2,
      id_8,
      id_8,
      id_6,
      id_4,
      id_5,
      id_5,
      id_1,
      id_2,
      id_5,
      id_4,
      id_5,
      id_5,
      id_5,
      id_6,
      id_8,
      id_8,
      id_5,
      id_4,
      id_1
  );
  wire [id_7 : -1] id_9;
  nand primCall (id_2, id_8, id_5, id_4);
endmodule
