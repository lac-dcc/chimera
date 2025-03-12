// Seed: 3911738736
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  inout tri id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
  if (-1) begin : LABEL_0
    logic id_9;
  end else begin : LABEL_1
    assign id_5 = 1;
  end
  wire id_10;
  wire id_11;
  parameter id_12 = -1;
  assign id_6 = id_7;
  wire id_13;
  ;
  parameter id_14 = id_12;
  assign id_11 = id_3;
endmodule
module module_1 #(
    parameter id_16 = 32'd70
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    _id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  inout reg id_23;
  inout wire id_22;
  inout wire id_21;
  inout wire id_20;
  xor primCall (
      id_2,
      id_22,
      id_21,
      id_12,
      id_1,
      id_10,
      id_19,
      id_5,
      id_6,
      id_8,
      id_24,
      id_17,
      id_25,
      id_11,
      id_18,
      id_20,
      id_9,
      id_13,
      id_23,
      id_7
  );
  inout logic [7:0] id_19;
  input wire id_18;
  inout wire id_17;
  inout wire _id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  always @({-1 == id_10, id_5}) id_23 = id_19;
  wire  id_24;
  logic id_25;
  module_0 modCall_1 (
      id_21,
      id_21,
      id_21,
      id_14,
      id_20,
      id_8,
      id_22
  );
  id_26 :
  assert property (@(posedge id_22) (id_11))
  else $clog2(91);
  ;
endmodule
