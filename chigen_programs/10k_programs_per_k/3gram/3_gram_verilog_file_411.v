// Seed: 2525427969
module module_0;
  wire id_2;
  wire id_3;
  logic [7:0] id_4;
  always @(posedge id_4[1 : 1]) begin : LABEL_0
    id_1 = id_3;
  end
  uwire id_5;
  wor id_6;
  supply0 id_7 = {id_4[1]{1}};
  assign module_1.id_6 = 0;
  wire id_8;
  wand id_9 = 1'b0 | id_6;
  wire id_10;
  assign id_5 = 1'h0;
endmodule
module module_1 (
    output tri0  id_0,
    input  wire  id_1,
    input  wor   id_2,
    input  tri   id_3,
    output wand  id_4,
    output wand  id_5,
    input  uwire id_6,
    input  wor   id_7
);
  assign id_4 = id_6;
  always #1 begin : LABEL_0
    id_5 = id_6;
    $display;
  end
  module_0 modCall_1 ();
endmodule
