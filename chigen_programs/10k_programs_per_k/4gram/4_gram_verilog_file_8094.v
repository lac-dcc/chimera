// Seed: 1936806860
module module_0 #(
    parameter id_6 = 32'd2
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6
);
  input wire _id_6;
  input wire id_5;
  inout wire id_4;
  output logic [7:0] id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3[-1] = "";
  logic [-1 : id_6] id_7;
endmodule
module module_1 #(
    parameter id_4 = 32'd68,
    parameter id_6 = 32'd87
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  output wire _id_6;
  output wire id_5;
  inout wire _id_4;
  inout wire id_3;
  output logic [7:0] id_2;
  output wire id_1;
  assign id_2[id_4] = -1 ? id_4 : id_4 ^ id_3;
  always @(posedge id_4 or negedge id_3) begin : LABEL_0
    $clog2(86);
    ;
  end
  assign id_4 = id_4;
  logic [1 : id_6] id_9 = -1'b0;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_2,
      id_3,
      id_9,
      id_4
  );
  static logic [1 : -1] id_10 = id_4;
endmodule
