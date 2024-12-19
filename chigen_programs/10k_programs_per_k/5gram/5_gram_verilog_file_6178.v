// Seed: 3149310726
module module_0;
  assign id_1 = 'b0;
endmodule
module module_1 ();
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  id_1 :
  assert property (@(posedge id_1) id_1.id_1)
  else $display(1);
  tri id_2;
  wor id_3 = 1 & id_1;
  always @(posedge id_1) begin : LABEL_0
    id_3 = id_2;
  end
endmodule
module module_2 (
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
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_10;
  wire id_11;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  always_comb @(posedge 1 + id_6 or 1 && id_3) begin : LABEL_0
    #1;
    id_3 <= 1;
    id_9 <= (id_9 - 1'b0);
    id_9 = 1 == id_9;
  end
  genvar id_12;
endmodule
