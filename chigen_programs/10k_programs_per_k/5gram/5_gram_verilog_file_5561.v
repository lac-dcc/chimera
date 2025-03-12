// Seed: 3245510979
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  logic [-1 : 1] id_3 = id_1;
  logic id_4;
  ;
endmodule
module module_1 (
    output tri0 id_0,
    output supply0 id_1,
    input tri1 id_2
);
  wire id_4;
  buf primCall (id_0, id_4);
  module_0 modCall_1 (
      id_4,
      id_4
  );
endmodule
module module_2 (
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
  output reg id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  output reg id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout uwire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout reg id_2;
  output reg id_1;
  module_0 modCall_1 (
      id_6,
      id_10
  );
  always @(posedge -1 or posedge id_9) begin : LABEL_0
    if (1'b0) id_1 <= -1;
    else id_2 <= id_2;
  end
  logic id_17;
  always_latch @(*)
    if (1) begin : LABEL_1
      id_16 <= id_4;
      id_18(id_2);
    end else id_12 <= id_17 ^ id_10 ==? id_7;
  assign id_7 = 1;
  wire id_19;
  localparam id_20 = 1;
  id_21 :
  assert property (@(posedge (1'b0)) id_8)
  else $clog2(86);
  ;
  wire id_22, id_23, id_24, id_25, id_26, id_27, id_28, id_29;
endmodule
