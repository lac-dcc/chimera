// Seed: 3872792542
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  always id_1[""] = id_6 ? -1'h0 : id_6;
endmodule
module module_1 #(
    parameter id_1 = 32'd21,
    parameter id_4 = 32'd19,
    parameter id_5 = 32'd84
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    _id_5
);
  inout wire _id_5;
  input wire _id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  inout wire _id_1;
  parameter id_6 = 1;
  always begin : LABEL_0
    @(posedge 1);
  end
  localparam id_7 = 1;
  wire id_8;
  parameter id_9 = id_6;
  wire [id_4 : (  id_1  )] id_10;
  assign id_3[id_5] = id_7;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_9,
      id_10,
      id_8,
      id_10,
      id_2,
      id_2
  );
  logic id_11;
endmodule
