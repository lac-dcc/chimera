// Seed: 2255854147
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
    id_16,
    id_17,
    id_18
);
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  localparam id_19 = 1'b0;
endmodule
module module_1 #(
    parameter id_14 = 32'd62,
    parameter id_15 = 32'd89,
    parameter id_9  = 32'd10
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output uwire id_7;
  output wire id_6;
  output wire id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  inout reg id_2;
  output logic [7:0] id_1;
  logic id_8;
  wire  _id_9;
  wire  id_10;
  `define pp_11 0
  assign id_8 = id_9;
  logic [1 : 1] id_12;
  localparam id_13 = 1;
  wire _id_14;
  assign `pp_11[1] = id_4[id_9];
  module_0 modCall_1 (
      id_13,
      id_13,
      id_10,
      id_8,
      id_6,
      id_10,
      id_12,
      id_8,
      id_12,
      id_12,
      id_12,
      id_8,
      id_8,
      id_13,
      id_7,
      id_8,
      id_12,
      id_12
  );
  assign id_7 = -1;
  wire _id_15;
  for (id_16 = ~-1 == id_9; id_2; id_2 = id_14) begin : LABEL_0
    logic [id_9 : id_14  <  -1] id_17;
  end
  wire [id_15 : -1] id_18;
endmodule
