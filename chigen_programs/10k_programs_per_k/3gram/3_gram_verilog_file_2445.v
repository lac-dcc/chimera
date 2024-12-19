// Seed: 3651003408
module module_0 ();
  task id_1();
    output id_2;
    id_1 = #1 1'd0;
  endtask
  assign module_3.id_1 = 0;
  assign id_2 = 1;
  assign module_2.id_0 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  assign id_2 = 1 === ~id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    output wire id_0,
    input  wand id_1
);
  wire id_3;
  `define pp_4 0
  wire id_5 = id_3;
  module_0 modCall_1 ();
endmodule
module module_3 (
    input  wor  id_0,
    output wor  id_1,
    input  tri0 id_2,
    output tri1 id_3
);
  always @(1 or posedge 1) begin : LABEL_0
    id_3 = id_0;
  end
  module_0 modCall_1 ();
endmodule
