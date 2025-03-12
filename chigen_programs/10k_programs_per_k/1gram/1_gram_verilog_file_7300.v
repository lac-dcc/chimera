// Seed: 636909097
program module_0 (
    id_1,
    id_2,
    id_3
);
  inout supply0 id_3;
  input wire id_2;
  input wire id_1;
  logic id_4;
  ;
  logic id_5;
  assign id_3 = -1;
endprogram
module module_1 #(
    parameter id_7 = 32'd26
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8[1 : id_7],
    id_9
);
  output wire id_9;
  input logic [7:0] id_8;
  inout wire _id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output reg id_2;
  output logic [7:0] id_1;
  assign id_6 = id_8 ? id_4 : id_7;
  localparam id_10 = 1;
  id_11 :
  assert property (@(id_8 or posedge -1 ^ id_4) id_7) begin : LABEL_0
    id_2 = id_7 | 1;
  end
  always begin : LABEL_1
    id_1[-1&-1 : 1][1'b0 :-1'd0][-1'b0 :-1] <= id_10;
  end
  module_0 modCall_1 (
      id_11,
      id_11,
      id_4
  );
endmodule
