// Seed: 2542213253
module module_0 #(
    parameter id_1 = 32'd82,
    parameter id_2 = 32'd30,
    parameter id_6 = 32'd62,
    parameter id_7 = 32'd23
) (
    _id_1,
    _id_2,
    id_3[-1 : id_7],
    id_4[id_2 :-1'b0],
    id_5,
    _id_6,
    _id_7,
    id_8,
    id_9
);
  output wire id_9;
  assign module_1.id_2 = 0;
  output wire id_8;
  output wire _id_7;
  input wire _id_6;
  inout wire id_5;
  output logic [7:0] id_4;
  inout logic [7:0] id_3;
  output wire _id_2;
  inout wire _id_1;
  wire [id_6 : id_1] id_10, id_11;
  assign id_8 = id_3;
  wire id_12;
endmodule
module module_1 #(
    parameter id_14 = 32'd99,
    parameter id_2  = 32'd43,
    parameter id_7  = 32'd39
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire _id_2;
  input wire id_1;
  logic id_6, _id_7;
  wire id_8, id_9[-1 'b0 : id_7];
  assign id_7 = $unsigned(id_7);
  ;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_6,
      id_6,
      id_8,
      id_7,
      id_7,
      id_8,
      id_5
  );
  logic id_10, id_11;
  assign id_10 = id_6;
  always id_6[""] <= 1;
  reg [id_2 : -1] id_12, id_13;
  logic _id_14;
  final begin : LABEL_0
    if (1) id_12 <= id_12;
  end
  localparam id_15 = 1;
  wire [1 : id_14] id_16;
endmodule
