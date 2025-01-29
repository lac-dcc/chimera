// Seed: 2241876315
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4, id_5;
  assign module_1.id_17 = 0;
  assign id_2 = -1;
  wire id_6 = id_3, id_7;
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    output wire id_2,
    input wire id_3,
    input supply1 id_4,
    output tri id_5,
    input tri id_6,
    output supply0 id_7,
    output tri1 id_8,
    input tri id_9,
    input wand id_10,
    input supply0 id_11,
    input logic id_12,
    output wand id_13,
    id_20,
    output wor id_14,
    input wire id_15,
    output wire id_16,
    input uwire id_17,
    output uwire id_18
);
  logic id_21 = id_12;
  genvar id_22;
  wire id_23;
  id_24 :
  assert property (@(!-1 or posedge (~id_0)) 1) begin : LABEL_0
    id_21 <= -1;
  end
  wire id_25;
  module_0 modCall_1 (
      id_22,
      id_22,
      id_25
  );
endmodule
