// Seed: 1339708692
module module_0 #(
    parameter id_8 = 32'd84
) (
    id_1,
    id_2
);
  output logic [7:0] id_2;
  input wire id_1;
  logic id_3 = id_1;
  wire  id_4;
  logic id_5;
  bit   id_6;
  assign id_3 = -1;
  wire  id_7;
  logic _id_8;
  ;
  parameter id_9 = 1;
  logic id_10, id_11;
  logic id_12;
  ;
  localparam id_13 = id_9;
  wire  id_14;
  logic id_15;
  wire  id_16;
  logic id_17, id_18 = 1;
  always_latch @(id_13[1]) id_6 = 1;
  assign id_2[id_8][-1'b0] = -1 ? 1 : id_15;
  assign id_5 = id_9;
endmodule
module module_1 #(
    parameter id_3 = 32'd40
) (
    output wire id_0,
    input  wand id_1
);
  wire _id_3;
  wire id_4, id_5;
  assign id_3 = id_1;
  logic [7:0][id_3 : 1] id_6, id_7;
  wire id_8, id_9, id_10, id_11, id_12;
  parameter id_13 = 1;
  wire id_14;
  wire id_15, id_16, id_17;
  logic id_18;
  module_0 modCall_1 (
      id_4,
      id_7
  );
  wire [-1 : 1] id_19;
  assign id_6[1] = id_15;
endmodule
