// Seed: 1291522234
program module_0 (
    output tri   id_0,
    input  uwire id_1,
    input  wor   id_2,
    input  wand  id_3,
    input  wor   id_4,
    input  wire  id_5
);
  assign id_0 = id_2;
  assign module_1.id_13 = 0;
  wire id_7;
endmodule
module module_1 #(
    parameter id_13 = 32'd15
) (
    input logic id_0,
    input wor id_1,
    input tri id_2,
    input tri0 id_3,
    output tri0 id_4,
    input wor id_5,
    input supply0 id_6
);
  always $display;
  logic [7:0] id_8, id_9;
  logic [7:0] id_10, id_11;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_1,
      id_6,
      id_6,
      id_1
  );
  initial id_10 = id_8;
  wire id_12;
  defparam id_13 = 1;
  always @(posedge -1) $display(id_5, id_1);
  reg id_14;
  id_15 :
  assert property (@(posedge -1) -1) begin : LABEL_0
    id_8 = id_11;
    id_14 <= id_0;
  end
  bit id_16;
  always id_11[-1'b0] <= id_16;
  assign id_14 = -1;
  wire id_17;
  assign id_4 = id_2;
  wire id_18;
endmodule
