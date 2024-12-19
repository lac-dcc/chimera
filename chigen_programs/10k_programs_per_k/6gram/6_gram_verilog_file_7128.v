// Seed: 2453624333
module module_0 ();
  wire id_1;
  wire id_2;
  assign module_1.type_1 = 0;
  wire id_3;
  wire id_4;
endmodule
module module_1 (
    output wire  id_0,
    output wor   id_1,
    input  uwire id_2
);
  wire id_4;
  module_0 modCall_1 ();
  always #1 begin : LABEL_0
    id_5(1);
  end
  assign id_4 = 1 - 1;
endmodule
module module_2;
  always @(1) begin : LABEL_0
    wait (1 == 1 & id_1);
    fork
      #1 id_1 = id_1;
      $display;
    join_none
    id_1 <= id_1;
    id_1 <= id_1;
    disable id_2;
    id_1 = 1'b0;
  end
  module_0 modCall_1 ();
endmodule
