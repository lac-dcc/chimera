// Seed: 4251199578
module module_0 #(
    parameter id_3 = 32'd48,
    parameter id_6 = 32'd92
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout logic [7:0] id_4;
  output wire _id_3;
  input wire id_2;
  inout wire id_1;
  wire  _id_6;
  logic id_7;
  bit   id_8 = id_4;
  initial begin : LABEL_0
    id_8 <= (id_7);
  end
  always begin : LABEL_1
    $clog2(12);
    ;
  end
endmodule
module module_1 #(
    parameter id_10 = 32'd82,
    parameter id_11 = 32'd65,
    parameter id_8  = 32'd39,
    parameter id_9  = 32'd33
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8
);
  output wire _id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  genvar _id_9;
  logic _id_10;
  ;
  parameter id_11 = -1;
  wire id_12;
  defparam id_11.id_11 = id_11 == -1;
  logic [7:0] id_13;
  module_0 modCall_1 (
      id_12,
      id_4,
      id_11,
      id_13,
      id_3
  );
  integer [id_8 : id_9] id_14 = 1;
  assign id_13[""] = id_13;
  wire id_15[1 'b0 : id_10];
  wire [-1 : 1] id_16;
endmodule
