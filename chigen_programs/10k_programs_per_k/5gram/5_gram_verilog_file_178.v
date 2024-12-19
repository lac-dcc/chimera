// Seed: 3516816810
module module_0 ();
  wire id_1;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4[1] = id_3;
  wire id_9;
  logic [7:0] id_10;
  wire id_11;
  wand id_12;
  assign (strong1, weak0) id_10[1'b0] = 1'b0;
  module_0 modCall_1 ();
  always @(1 or negedge id_2)
    if (id_12++)
      if (id_8 <= id_3) begin : LABEL_0
        if (1'b0) id_3 = id_6;
      end else begin : LABEL_0
        id_3 <= 1;
      end
endmodule
