// Seed: 1710948221
module module_0;
  parameter id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  xor primCall (id_1, id_3, id_4, id_5, id_7, id_8);
  module_0 modCall_1 ();
  parameter id_9 = 1;
endmodule
module module_0 #(
    parameter id_0 = 32'd14,
    parameter id_3 = 32'd26
) (
    input  tri0  _id_0,
    output logic module_2
);
  parameter id_3 = 1;
  logic id_4;
  assign id_4 = id_0;
  assign id_4[1] = id_3;
  always @(negedge -1 == id_4 or posedge -1) begin : LABEL_0
    id_1 = 1'b0;
  end
  module_0 modCall_1 ();
  integer [id_0 : id_3] id_5;
endmodule
