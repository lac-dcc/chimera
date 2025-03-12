// Seed: 1803875704
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output logic [7:0] id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6[-1'h0] = 1;
endmodule
module module_1 #(
    parameter id_3 = 32'd40,
    parameter id_5 = 32'd20,
    parameter id_9 = 32'd26
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6
);
  inout wire id_6;
  inout wire _id_5;
  inout logic [7:0] id_4;
  inout wire _id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_1,
      id_2
  );
  output logic [7:0] id_1;
  reg id_7;
  always @(-1 or posedge id_4[1'b0]) begin : LABEL_0
    case (id_5)
      1:  id_7 = id_4;
      1:  id_4[id_3 : ~id_5] = 1'b0;
      -1: id_7 = -1'b0 * id_5;
    endcase
  end
  wire [-1 : 1] id_8, _id_9;
  logic id_10;
  assign id_10[1'b0] = id_4;
  assign id_1[id_9 : 1] = id_7 ? -1 : -1;
  id_11 :
  assert property (@(posedge id_3) id_2)
  else $unsigned(62);
  ;
endmodule
