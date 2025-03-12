// Seed: 2065062213
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
    id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_19;
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  parameter id_20 = 1;
  wire id_21;
  generate
    initial begin : LABEL_0
      $unsigned(16);
      ;
    end
  endgenerate
endmodule
module module_1 #(
    parameter id_10 = 32'd24
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  output wire id_1;
  logic id_7;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_7,
      id_2,
      id_6,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_4,
      id_5,
      id_7,
      id_7,
      id_2,
      id_7,
      id_2,
      id_7,
      id_2
  );
  localparam id_8 = -1'd0 + 1;
  id_9 :
  assert property (@(posedge id_2) id_3)
  else $unsigned(74);
  ;
  wire _id_10;
  ;
  always id_3[id_10] <= 1'b0;
  wire id_11;
  ;
  always @(posedge 1) begin : LABEL_0
    id_9 = -1;
    id_9 = id_2;
  end
  wire id_12 = id_3;
  xnor primCall (id_3, id_4, id_2, id_5, id_7);
  logic id_13;
  ;
  parameter id_14 = id_8;
endmodule
