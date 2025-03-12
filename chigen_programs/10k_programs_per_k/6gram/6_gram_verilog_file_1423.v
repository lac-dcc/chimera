// Seed: 1449153096
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
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire  id_12;
  logic id_13 = id_9;
endmodule
module module_1 #(
    parameter id_10 = 32'd38
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
    _id_10,
    id_11
);
  inout wire id_11;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_11,
      id_9,
      id_6,
      id_9,
      id_11,
      id_11,
      id_2,
      id_11,
      id_11
  );
  input wire _id_10;
  output wire id_9;
  output logic [7:0] id_8;
  output wire id_7;
  input wire id_6;
  output reg id_5;
  inout reg id_4;
  output logic [7:0] id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4 = ~(id_11);
  assign id_3[id_10] = id_10;
  initial begin : LABEL_0
    if (-1 || 1) begin : LABEL_1
      if (1) begin : LABEL_2
        $clog2(85);
        ;
        id_4 <= {-1, 1 - id_6};
      end else id_5 <= id_4 + 1;
    end else id_8[1] <= 1;
  end
  wire id_12;
endmodule
