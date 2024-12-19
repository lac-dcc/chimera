// Seed: 3928898448
module module_0;
  wire id_1;
  task id_3;
    begin : LABEL_0
      id_2 <= 1'b0;
      id_3 <= id_2;
    end
  endtask
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input  wand  id_0,
    output wire  id_1,
    output tri   id_2,
    input  uwire id_3,
    output uwire id_4
    , id_8,
    output tri1  id_5,
    input  wor   id_6
);
  uwire id_9 = 1;
  assign id_1 = 1;
  module_0 modCall_1 ();
  assign id_4 = id_0;
endmodule
module module_2 (
    output tri   id_0,
    input  tri0  id_1,
    input  tri0  id_2,
    input  tri0  id_3,
    input  uwire id_4,
    output tri   id_5
);
  logic [7:0] id_7;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
  always #1 begin : LABEL_0
    assign id_0 = id_7[1 : 1];
  end
  wor  id_8 = 1;
  wand id_9 = 1;
endmodule
