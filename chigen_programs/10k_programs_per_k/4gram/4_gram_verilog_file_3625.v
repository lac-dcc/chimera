// Seed: 3744718999
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  supply0 id_9 = -1'b0;
  parameter id_10 = -1;
  wire id_11 = id_6;
endmodule
module module_1 #(
    parameter id_4 = 32'd78
) (
    input  tri1  id_0,
    input  wor   id_1,
    output logic id_2,
    output logic id_3,
    input  tri0  _id_4
);
  logic [7:0] id_6;
  wire id_7;
  assign id_6[id_4] = id_0;
  always @(negedge -1'b0 * id_6) begin : LABEL_0
    id_8();
    id_8 = id_1 + 1'b0;
    id_3 = -1;
    id_2 = -1;
    if (1) begin : LABEL_1
      $signed(50);
      ;
      id_3 = id_0;
    end
  end
  logic [-1 'b0 : -1] id_9 = -1'b0;
  wire id_10;
  assign id_10 = id_6 ? id_6 : id_7;
  supply1 id_11;
  assign id_6  = id_6;
  assign id_9  = id_1;
  assign id_11 = 1 ==? 1;
  module_0 modCall_1 (
      id_11,
      id_9,
      id_7,
      id_9,
      id_11,
      id_11,
      id_7,
      id_9
  );
endmodule
