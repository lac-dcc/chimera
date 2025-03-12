// Seed: 116873274
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  assign id_4 = id_1;
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
    id_9
);
  input wire id_9;
  output supply1 id_8;
  inout wire id_7;
  input logic [7:0] id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2
  );
  assign id_8 = -1;
  localparam id_10 = 1;
  bit id_11;
  ;
  always @(posedge id_11 or -1'h0) begin : LABEL_0
    id_11 = id_2;
    if (~id_10 == 1) begin : LABEL_1
      wait (-1'b0);
    end else begin : LABEL_2
      disable id_12;
    end
  end
  logic id_13;
endmodule
