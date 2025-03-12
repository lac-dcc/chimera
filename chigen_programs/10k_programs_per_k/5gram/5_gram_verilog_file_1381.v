// Seed: 1754904411
module module_0 #(
    parameter id_9 = 32'd22
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9
);
  input wire _id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output tri id_3;
  inout wire id_2;
  input wire id_1;
  logic [7:0] id_10[-1 : id_9];
  initial begin : LABEL_0
    id_10[-1] <= 1;
  end
  logic id_11;
  ;
  assign id_3 = -1;
endmodule
module module_1 #(
    parameter id_3 = 32'd82,
    parameter id_6 = 32'd58
) (
    id_1,
    id_2,
    _id_3,
    id_4
);
  input wire id_4;
  input wire _id_3;
  inout wire id_2;
  inout wire id_1;
  logic [id_3 : -1] id_5;
  ;
  parameter id_6 = 1;
  logic id_7;
  generate
    defparam id_6.id_6 = id_6;
    assign id_7 = 1;
  endgenerate
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_2,
      id_1,
      id_5,
      id_5,
      id_7,
      id_6
  );
endmodule
