// Seed: 267531807
module module_0 ();
  logic [1 : -1] id_1;
  logic [7:0] id_2;
  always_ff @(posedge id_1) id_2[""] = id_1 * id_2 + 1;
  always @(posedge 1 or posedge (-1'b0) | id_1) begin : LABEL_0
    wait (id_2[-1 : 1] - id_1);
  end
  wire id_3;
  wire [-1 : 1] id_4;
endmodule
module module_1 #(
    parameter id_1 = 32'd68
) (
    _id_1,
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
    id_12
);
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire _id_1;
  logic id_13;
  ;
  assign id_13 = id_3;
  logic id_14;
  ;
  module_0 modCall_1 ();
  logic [id_1 : -1] id_15;
  ;
  localparam id_16 = 1;
endmodule
