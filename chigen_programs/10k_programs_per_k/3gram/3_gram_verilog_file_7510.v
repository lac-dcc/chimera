// Seed: 1643071249
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  output reg id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout reg id_2;
  inout wire id_1;
  wire id_11;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_10,
      id_10
  );
  always @(posedge 1)
    if (-1'b0)
      for (id_9 = 1; id_4; id_9 = 1) begin : LABEL_0
        id_2 <= 1;
      end
    else begin : LABEL_1
      begin : LABEL_2
        #1;
      end
    end
  logic id_12;
  ;
endmodule
