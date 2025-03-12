// Seed: 3904169073
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
    id_11,
    module_0
);
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output reg id_3;
  input wire id_2;
  inout wire id_1;
  always @(1 or posedge id_9) begin : LABEL_0
    id_3 <= id_4;
  end
  assign module_1.id_1 = 0;
endmodule
module module_1;
  reg id_1;
  localparam id_2 = 1;
  reg id_3;
  parameter id_4 = 1 ? id_2 : -1 ? id_2 : id_2 ? id_2 : id_2;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_2,
      id_2,
      id_4,
      id_4,
      id_2,
      id_2
  );
  always begin : LABEL_0
    id_1 <= -1 ~^ 1;
    id_3 <= #1 id_4;
  end
endmodule
