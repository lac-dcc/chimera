// Seed: 4106628643
module module_0;
  wand id_2;
  wand id_3;
  assign id_3 = 1;
  reg id_4, id_5, id_6;
  wire id_7;
  wire id_8;
  wire id_9;
  initial begin : LABEL_0
    #1 $display;
    id_2 = 1;
    id_5 <= id_4;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  always @(posedge 1) if (1'd0) id_1 = id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  reg id_4;
  always @(id_2 or posedge 1) id_4 = #1 1;
endmodule
