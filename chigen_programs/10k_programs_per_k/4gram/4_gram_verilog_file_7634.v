// Seed: 34981065
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
    id_10
);
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd51
) (
    id_1,
    id_2,
    _id_3
);
  output wire _id_3;
  output wire id_2;
  inout wire id_1;
  logic id_4;
  logic [$realtime : id_3] id_5;
  wire id_6;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_2,
      id_1,
      id_6,
      id_5,
      id_6
  );
  parameter id_7 = 1'b0;
  always @(negedge id_6) begin : LABEL_0
    assign id_2 = -1;
  end
endmodule
