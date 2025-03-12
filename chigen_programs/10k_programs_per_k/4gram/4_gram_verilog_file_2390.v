// Seed: 3217612555
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output supply1 id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6 = 1;
  logic id_12;
  parameter id_13 = -1'b0;
endmodule
module module_1 #(
    parameter id_3 = 32'd59
) (
    id_1,
    id_2,
    _id_3
);
  input wire _id_3;
  output logic [7:0] id_2;
  input wire id_1;
  always @(posedge id_1) begin : LABEL_0
    wait (1);
  end
  parameter id_4 = 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign id_2[id_3] = -1 ? id_3 : id_4;
endmodule
