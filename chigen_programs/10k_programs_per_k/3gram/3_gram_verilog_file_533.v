// Seed: 3520859182
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
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign {1, 1} = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd24,
    parameter id_4 = 32'd9
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  module_0 modCall_1 (
      id_1,
      id_8,
      id_9,
      id_1,
      id_8,
      id_1,
      id_3,
      id_1,
      id_1,
      id_8,
      id_6,
      id_7,
      id_1,
      id_1
  );
  inout wire _id_4;
  output wire id_3;
  inout wire _id_2;
  inout wire id_1;
  always @(posedge -1 or posedge 1) begin : LABEL_0
    $signed(57);
    ;
  end
  struct packed {
    logic id_10;
    logic id_11;
  } id_12;
  logic [id_4 : id_2] id_13;
  always_ff @(posedge -1);
endmodule
