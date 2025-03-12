// Seed: 496279674
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign module_2.id_8 = 0;
  assign id_1 = id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output tri id_3;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_1
  );
  input wire id_2;
  inout wire id_1;
  wire id_4;
  assign id_3 = -1'b0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output reg id_7;
  input wire id_6;
  input wire id_5;
  inout reg id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    id_4 <= -1;
    $clog2(19);
    ;
    if (1) begin : LABEL_1
      if (-1) begin : LABEL_2
        id_7 <= id_6;
        assert (-1'd0);
      end else begin : LABEL_3
        if ("" && -1'h0) begin : LABEL_4
          id_7 <= id_6;
        end else id_7 = 1;
      end
    end else assert (id_6);
  end
  assign id_7 = id_5;
  logic [-1 'b0 : -1] id_8;
  wire [-1 : ""] id_9;
  assign id_8 = -1'h0 & id_1;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_8
  );
  wire id_10;
  wire id_11;
  genvar id_12;
  initial assume (id_9);
endmodule
