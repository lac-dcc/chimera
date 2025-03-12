// Seed: 1792970823
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  localparam integer id_3 = "";
  assign id_1 = -1;
  logic id_4;
endmodule
macromodule module_1 #(
    parameter id_13 = 32'd8
) (
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
    _id_13,
    id_14
);
  input wire id_14;
  inout wire _id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  parameter id_15 = -1;
  if (1) begin : LABEL_0
    assign id_10 = ~"";
  end
  assign id_10 = id_13;
  reg id_16;
  wire [-1 : -1  &  -1] id_17;
  assign id_2[id_13+1] = 1;
  wire id_18;
  ;
  module_0 modCall_1 (
      id_6,
      id_12
  );
  assign id_18 = id_18;
  id_19 :
  assert property (@(id_14) id_3)
  else begin : LABEL_1
    id_16 <= 1 - id_3;
  end
endmodule
