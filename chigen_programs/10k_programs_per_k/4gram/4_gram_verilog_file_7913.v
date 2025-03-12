// Seed: 2458640750
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic id_5;
endmodule
module module_1 #(
    parameter id_6 = 32'd82,
    parameter id_7 = 32'd17
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    _id_7
);
  input wire _id_7;
  inout wire _id_6;
  inout reg id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire [1 'b0 : (  1  )  ^  id_7] id_8;
  always_ff @(-1'b0 or posedge id_8) begin : LABEL_0
    if (1) id_5 = 1;
  end
  wire id_9;
  logic [-1 : id_6] id_10;
  localparam id_11 = "" !== 1 - 1;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_10,
      id_9
  );
endmodule
