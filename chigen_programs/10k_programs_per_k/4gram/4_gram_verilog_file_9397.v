// Seed: 1869625590
module module_0 #(
    parameter id_4 = 32'd82
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  input wire id_5;
  inout wire _id_4;
  output wire id_3;
  assign module_1.id_8 = 0;
  input wire id_2;
  output logic [7:0] id_1;
  assign id_1[id_4] = -1 ? id_4 : 1'b0;
endmodule
module module_1 #(
    parameter id_13 = 32'd73,
    parameter id_8  = 32'd64,
    parameter id_9  = 32'd35
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout logic [7:0] id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output supply0 id_1;
  assign id_1 = -1 - !id_4;
  parameter id_8 = -1;
  localparam id_9 = -1;
  wire id_10 = id_6;
  wire id_11 = id_4;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_10,
      id_9,
      id_7
  );
  wire id_12;
  wire _id_13;
  wire [1 'b0 : id_13] id_14 = id_13;
  assign id_6[id_8+:id_9-{id_9, 1+-1}] = 1;
  logic id_15;
  ;
  wire id_16 = id_7;
endmodule
