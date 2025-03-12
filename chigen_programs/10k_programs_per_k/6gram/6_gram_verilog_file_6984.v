// Seed: 1226665520
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  assign module_1.id_5 = 0;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_7;
endmodule
module module_1 #(
    parameter id_5 = 32'd97
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout reg id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire _id_5;
  logic [7:0] id_6;
  wire id_7;
  ;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_2,
      id_7,
      id_7,
      id_7
  );
  always @(id_6[id_5] or posedge id_4 - 1) begin : LABEL_0
    id_4 <= id_7;
  end
  logic id_8;
  initial
    if (-1) begin : LABEL_1
      #1;
      wait (id_5);
    end
endmodule
