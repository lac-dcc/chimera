// Seed: 372713292
module module_0;
  wire id_1;
  assign module_3.id_13 = 0;
  assign module_2.id_4  = 0;
  assign module_1.id_4  = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output tri0 id_1,
    output tri1 id_2,
    input wire id_3,
    input tri1 id_4
);
  bufif0 primCall (id_1, id_3, id_4);
  assign id_2 = 1;
  assign id_1 = -1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input tri1 id_0,
    output supply0 id_1,
    output wire id_2,
    output wand id_3,
    input uwire id_4,
    input wor id_5
);
  genvar id_7;
  module_0 modCall_1 ();
endmodule
module module_3 #(
    parameter id_7 = 32'd44
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  input logic [7:0] id_3;
  output wire id_2;
  input wire id_1;
  wand _id_7, id_8 = 1;
  if (1) begin : LABEL_0
    assign id_2 = id_3[-1 :-1'h0&id_7];
  end else begin : LABEL_1
    assign id_2 = id_1;
  end
  parameter id_9 = 1;
  tri1 id_10, id_11, id_12, id_13, id_14;
  assign id_13 = -1;
  assign id_2  = ~id_5;
  logic id_15;
  module_0 modCall_1 ();
  assign id_10 = 1;
endmodule
