// Seed: 3560403220
module module_0;
  reg id_1, id_2;
  initial
    if (1) begin : LABEL_0
      id_2 <= 1;
      begin : LABEL_0
        id_1 = 1'b0 == 1;
      end
    end
  wire id_3;
  wire id_4;
  reg id_5, id_6, id_7, id_8, id_9;
  assign id_6 = id_2;
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
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  logic [7:0] id_9;
  nand primCall (id_1, id_10, id_3, id_4, id_5, id_6, id_7, id_9);
  id_10 :
  assert property (@(1 or negedge id_3) ~id_3) @(negedge id_5) @(posedge 1) id_1 = id_9;
  assign id_1[1] = id_5;
  module_0 modCall_1 ();
  assign id_10 = id_10;
endmodule
