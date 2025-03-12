// Seed: 2226312616
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
endmodule
module module_1 #(
    parameter id_3 = 32'd12
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output logic [7:0] id_5;
  inout wire id_4;
  inout wire _id_3;
  input wire id_2;
  output wire id_1;
  logic id_7;
  ;
  wire id_8 = id_4;
  wire id_9;
  module_0 modCall_1 (
      id_4,
      id_7
  );
  wire id_10;
endmodule
module module_2 #(
    parameter id_8 = 32'd53,
    parameter id_9 = 32'd99
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    _id_9,
    id_10,
    id_11
);
  output wire id_11;
  output wire id_10;
  input wire _id_9;
  inout wire _id_8;
  inout wire id_7;
  inout logic [7:0] id_6;
  output reg id_5;
  inout wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_2,
      id_10
  );
  output wire id_2;
  inout wire id_1;
  assign id_5 = 1;
  wire id_12;
  genvar id_13;
  initial begin : LABEL_0
    id_5 <= id_3;
  end
  wire id_14, id_15, id_16, id_17, id_18, id_19, id_20, id_21;
  always @(posedge id_4, posedge id_12 - id_13) begin : LABEL_1
    id_6[-1][id_8] <= -1;
  end
  wire [id_9 : -1] id_22, id_23, id_24, id_25, id_26, id_27, id_28, id_29, id_30, id_31;
endmodule
