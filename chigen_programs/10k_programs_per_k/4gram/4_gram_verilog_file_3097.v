// Seed: 3266360702
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  localparam id_7 = 1;
  wire id_8;
  ;
  assign id_6 = id_8;
endmodule
module module_1 #(
    parameter id_3 = 32'd0
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire _id_3;
  output reg id_2;
  output reg id_1;
  parameter id_12 = ({1{1}});
  always @(posedge id_12 * -1) begin : LABEL_0
    forever begin : LABEL_1
      id_1 <= &id_4;
      id_2 = -1;
      id_1 <= id_12;
    end
  end
  initial begin : LABEL_2
    return -1;
  end
  wire [1 : id_3] id_13;
  module_0 modCall_1 (
      id_5,
      id_12,
      id_13,
      id_5,
      id_6,
      id_5
  );
endmodule
