// Seed: 3179048504
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output reg id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(posedge ~id_4 or negedge 1) begin : LABEL_0
    id_5 <= id_2;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output logic [7:0] id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout supply1 id_3;
  input wire id_2;
  input wire id_1;
  wire [-1 : 1 'b0] id_10;
  final $clog2(17);
  ;
  logic id_11;
  assign id_11 = -1'b0;
  assign id_9[-1] = -1'b0 !=? id_6 * id_6 + -1;
  reg id_12;
  assign id_5 = id_12;
  assign id_3 = -1'b0 == id_7;
  wire id_13;
  ;
  always_comb @(posedge 1, posedge id_2) #1 if (-1) id_12 = id_7;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_10,
      id_5,
      id_12,
      id_13
  );
  logic id_14;
endmodule
