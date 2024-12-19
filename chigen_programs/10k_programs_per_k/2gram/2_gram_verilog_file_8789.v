// Seed: 1446675095
module module_0;
  wor id_1 = 1;
  module_2 modCall_1 (id_1);
  assign modCall_1.id_4 = 0;
  assign module_1.id_5  = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
  reg  id_4 = id_2;
  reg  id_5;
  reg  id_6;
  initial #1 id_6 <= id_2;
  assign id_5 = id_4;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1
);
  output wire id_1;
  wire id_3;
  wand id_4;
  wire id_5;
  assign #id_6 id_2 = 1'b0;
  assign id_4 = 1'd0;
  always begin : LABEL_0
    #id_7;
  end
endmodule
