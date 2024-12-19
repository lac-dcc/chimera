// Seed: 1851877989
module module_0 ();
  always @(posedge !id_1 - 1 or id_1++
  )
  begin : LABEL_0
    id_1 <= 1'b0;
    {1, 1'b0, id_1 != id_1, 1} = (1 - id_1);
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  always @(posedge 1) begin : LABEL_0
    disable id_4;
  end
  wire id_5;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1 || id_1 > id_4;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  initial begin : LABEL_0
    `define pp_5 0
    id_1 <= 1;
    wait (id_1 == 1'b0);
    $display(1'b0 & `pp_5);
  end
  tri0 id_6 = id_2 < $display(1, id_4, id_6, id_2 ^ id_4);
endmodule
