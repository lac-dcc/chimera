// Seed: 988308330
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  assign module_1.id_5 = 0;
  output wire id_2;
  output wire id_1;
  logic id_4;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd11
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout reg id_5;
  output logic [7:0] id_4;
  inout wire id_3;
  input wire id_2;
  input wire _id_1;
  always @(posedge 1) begin : LABEL_0
    id_5 <= id_5;
  end
  always_latch @(-1 or negedge 1 & 1'b0) begin : LABEL_1
    id_5 = 1;
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2
  );
  assign id_4[id_1==1] = -1;
  assign id_3 = id_1;
  logic id_6 = id_1, id_7;
endmodule
