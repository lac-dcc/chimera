// Seed: 376311565
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    module_0,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  input logic [7:0] id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_6 = (id_8[1'd0]);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input logic [7:0] id_2;
  inout logic [7:0] id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_4,
      id_4,
      id_3
  );
  wire id_5;
  initial begin : LABEL_0
    begin : LABEL_1
      if (-1) begin : LABEL_2
        id_1 -= id_5 & -1;
      end
    end
  end
  assign id_5 = id_2[-1];
  logic id_6;
  ;
  assign id_1[-1+:1] = id_3 == -1 ? 1 == id_1[-1] : 1'b0;
endmodule
