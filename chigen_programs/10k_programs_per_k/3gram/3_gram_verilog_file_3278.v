// Seed: 3816827945
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input logic [7:0] id_7;
  output supply0 id_6;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_6,
      id_9
  );
  input wire id_5;
  input wire id_4;
  inout logic [7:0] id_3;
  output wire id_2;
  input wire id_1;
  wire id_15;
  ;
  id_16 :
  assert property (@(posedge 1) id_3)
  else if (-1'b0) id_3[-1] = id_9;
  else begin : LABEL_0
    if (1) disable id_17;
  end
  parameter id_18 = 1;
  assign id_6 = -1'b0 ^ id_7[-1'b0];
endmodule
