// Seed: 3372180845
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
    id_11
);
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic [-1 : -1] id_12;
  always @(posedge 1 & 1'd0 or posedge -1) begin : LABEL_0
    @(posedge id_11);
    $unsigned(4);
    ;
  end
  localparam id_13 = -1'h0;
  logic id_14;
  ;
endmodule
module module_1 #(
    parameter id_9 = 32'd90
) (
    id_1#(
        .id_2(-1),
        .id_3(-1)
    ),
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11
);
  inout wire _id_9;
  input wire id_8;
  and primCall (id_7, id_3, id_1, id_6, id_5, id_11, id_4, id_2, id_8);
  inout wire id_7;
  input wire id_6;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_4,
      id_10,
      id_10,
      id_1,
      id_10,
      id_10,
      id_11,
      id_10,
      id_10
  );
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire [~  id_9 : -1] id_12;
endmodule
