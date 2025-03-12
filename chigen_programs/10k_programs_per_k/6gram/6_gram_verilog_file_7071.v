// Seed: 3412112051
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  logic id_8, id_9;
  wire id_10;
  ;
  always @(posedge id_3 or id_7 == id_10) begin : LABEL_0
    id_8 = -1;
  end
endmodule
module module_1 #(
    parameter id_6 = 32'd42
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7
);
  output logic [7:0] id_7;
  input wire _id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire [-1 'b0 : -1  &  id_6  &  id_6] id_8;
  logic id_9, id_10, id_11;
  parameter id_12 = 1;
  assign id_10 = id_3 == |id_12;
  assign id_7[-1] = -1;
  assign id_1 = !1;
  module_0 modCall_1 (
      id_12,
      id_2,
      id_10,
      id_9,
      id_9,
      id_10
  );
endmodule
