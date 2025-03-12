// Seed: 1586166469
module module_0 #(
    parameter id_2 = 32'd97,
    parameter id_6 = 32'd69,
    parameter id_7 = 32'd38,
    parameter id_8 = 32'd28
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output supply0 id_4;
  inout wire id_3;
  input wire _id_2;
  inout reg id_1;
  final begin : LABEL_0
    if (1) begin : LABEL_1
      assume #1  (-1) $signed(17);
      ;
    end else begin : LABEL_2
      SystemTFIdentifier;
      id_1 <= id_3;
    end
  end
  assign id_5 = id_2;
  logic _id_6 = id_6;
  wire _id_7;
  logic _id_8 = id_5;
  logic [id_7 : id_2] id_9 = id_2;
  wire [id_6  *  id_8 : -1] id_10;
  always_ff @(posedge ~id_5 or posedge -1) begin : LABEL_3
    fork
      $clog2(51);
      ;
      id_11;
    join_any
  end
endmodule
module module_1 #(
    parameter id_0 = 32'd33,
    parameter id_1 = 32'd13,
    parameter id_4 = 32'd86,
    parameter id_4 = 32'd99
) (
    input supply1 _id_0,
    input wand _id_1,
    input wand id_2
);
  localparam id_4 = 'b0;
  wire [-1 'b0 : id_0] id_5;
  wire [id_1  -  id_0 : id_4  ^ ""] id_6;
  reg [id_0 : 1] id_7;
  wire id_8;
  wire id_9;
  always_latch @(-1) begin : LABEL_0
    id_7 <= id_1;
  end
  defparam id_4.id_4 = id_4;
  assign id_8 = id_7;
  module_0 modCall_1 (
      id_7,
      id_4,
      id_9,
      id_5,
      id_8
  );
endmodule
