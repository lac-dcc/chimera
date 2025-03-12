// Seed: 1983097700
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
endmodule
module module_1 #(
    parameter id_7 = 32'd19
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9
);
  input wire id_9;
  output reg id_8;
  input wire _id_7;
  input wire id_6;
  inout wire id_5;
  inout uwire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  always @(*) begin : LABEL_0
    id_8 <= id_6;
  end
  localparam id_10 = 1 - 1;
  module_0 modCall_1 (
      id_1,
      id_10,
      id_10,
      id_3,
      id_5,
      id_5
  );
  wire [-1 : id_7] id_11 = id_5;
  assign id_4 = id_11;
  assign id_3 = (id_1);
  assign id_4 = 1;
endmodule
