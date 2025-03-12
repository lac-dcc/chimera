// Seed: 366331002
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout reg id_1;
  logic id_4;
  always @(posedge 1'b0) id_1 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd64
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output logic [7:0] id_5;
  inout reg id_4;
  output reg id_3;
  inout wire _id_2;
  output wire id_1;
  assign id_5[id_2] = "";
  assign id_4 = id_2 && id_6;
  assign id_4 = id_4;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_7,
      id_1
  );
  wire id_8;
  ;
  always @(*) id_3 = id_6;
  assign id_4 = id_6;
  always @(posedge id_7 == -1) begin : LABEL_0
    id_4 <= 1;
  end
endmodule
