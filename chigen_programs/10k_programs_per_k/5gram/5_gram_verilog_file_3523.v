// Seed: 702619508
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign module_1.id_4 = 0;
  bit id_9;
  ;
  always @(posedge -1) begin : LABEL_0
    $unsigned(80);
    ;
    id_9 <= #1 id_6;
  end
  wire  id_10;
  logic id_11;
  ;
endmodule
module module_1 #(
    parameter id_4 = 32'd8
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  input wire id_8;
  input logic [7:0] id_7;
  input wire id_6;
  inout wire id_5;
  input wire _id_4;
  inout wire id_3;
  input wire id_2;
  inout reg id_1;
  always @(id_5 == -1) id_1 = -1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_6,
      id_3,
      id_5,
      id_6,
      id_9,
      id_3
  );
  assign id_3 = id_1 ? -1 : -1;
endmodule
