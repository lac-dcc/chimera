// Seed: 2275810543
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_5 = id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output uwire id_5;
  inout reg id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = 1'd0;
  wire id_6;
  nor primCall (id_4, id_1, id_2, id_8, id_3, id_6);
  wor   id_7;
  logic id_8;
  ;
  assign id_8 = id_2 < id_4;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_6,
      id_7
  );
  wire id_9, id_10, id_11;
  always @(*) begin : LABEL_0
    id_4 <= -1;
  end
  logic id_12;
  ;
  logic id_13 = 1'h0;
  assign id_7  = 1;
  assign id_11 = (id_9);
  wire id_14;
  ;
  localparam id_15 = 1'b0;
endmodule
