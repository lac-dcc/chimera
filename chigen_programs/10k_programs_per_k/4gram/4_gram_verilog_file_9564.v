// Seed: 3177779549
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
    id_14
);
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  parameter id_15 = 1'b0;
endmodule
module module_1 #(
    parameter id_1 = 32'd27,
    parameter id_4 = 32'd78
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout reg id_7;
  inout wire id_6;
  output tri0 id_5;
  output wire _id_4;
  output reg id_3;
  input wire id_2;
  inout wire _id_1;
  always #1 id_3 = ~id_1;
  logic [7:0] id_9;
  ;
  assign id_5 = 1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_8,
      id_2,
      id_6,
      id_6,
      id_6,
      id_6,
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  always @(posedge 1 or posedge -1 + -1) begin : LABEL_0
    #1;
    id_9[id_1] <= id_8;
    begin : LABEL_1
      assign id_1 = "";
    end
    id_7 <= id_2;
    $clog2(9);
    ;
    id_3 = 1 - 1'b0;
  end
  assign id_6 = id_7;
  uwire id_10 = 1'b0 + "";
  logic [id_4 : -1] id_11;
  ;
endmodule
