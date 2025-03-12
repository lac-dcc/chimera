// Seed: 3717523886
module module_0 #(
    parameter id_1 = 32'd76,
    parameter id_3 = 32'd57
) (
    _id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire _id_3;
  input wire id_2;
  output wire _id_1;
  logic [id_1  ?  -1 : id_3 : 1] id_9;
endmodule
module module_1 #(
    parameter id_16 = 32'd89,
    parameter id_2  = 32'd69
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  output logic [7:0] id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output logic [7:0] id_5;
  input wire id_4;
  inout supply0 id_3;
  input wire _id_2;
  inout wire id_1;
  always_latch
    if (1) begin : LABEL_0
      id_11[1] = id_4;
    end else begin : LABEL_1
      id_5[-1] = id_2;
    end
  wire id_13;
  assign id_9 = id_3;
  wire id_14;
  wire [id_2 : 1  * "" ==  1] id_15;
  localparam id_16 = 1;
  module_0 modCall_1 (
      id_16,
      id_15,
      id_16,
      id_4,
      id_9,
      id_1,
      id_7,
      id_15
  );
  assign id_15 = id_16;
  wire id_17;
  defparam id_16.id_16 = 1;
  assign id_3 = -1;
endmodule
