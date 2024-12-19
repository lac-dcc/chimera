// Seed: 282515203
module module_0;
  wire id_2;
  wire id_3;
  assign module_2.type_14 = 0;
  wire id_4, id_5, id_6;
  wire id_7;
endmodule
module module_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output supply1 id_0,
    output tri id_1,
    input supply1 id_2,
    input supply1 id_3,
    input tri0 id_4,
    input wand id_5,
    input wire id_6,
    input tri id_7,
    input logic id_8
);
  reg id_10;
  initial begin : LABEL_0
    #1 begin : LABEL_0
      @(1 or 1 or id_8) id_10 <= 1;
    end
  end
  module_0 modCall_1 ();
  reg id_11;
  assign id_1 = 1;
  always_latch @(posedge 1) begin : LABEL_0
    id_11 <= id_8;
  end
endmodule
