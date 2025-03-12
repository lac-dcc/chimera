// Seed: 1171356687
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
    id_14,
    id_15,
    id_16
);
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_17;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd29
) (
    output logic id_0,
    input  wire  _id_1
);
  assign id_0 = {-1, 1};
  always @(negedge ~id_1) begin : LABEL_0
    id_0 <= !id_1;
  end
  always @(id_1) begin : LABEL_1
    id_0 = id_1 - 1;
    id_0 = "";
    if (1 - 1) id_0 <= id_1;
  end
  logic [!  -1 'b0 : id_1] id_3 = id_3;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_3,
      id_4,
      id_3,
      id_4
  );
  assign id_3 = id_3;
  localparam id_5 = 1;
endmodule
