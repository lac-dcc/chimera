// Seed: 1322708880
module module_0 ();
  module_3 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_1;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 ();
  wire id_5;
  assign id_3[1'b0] = id_2;
  wire id_6;
  wire id_7;
endmodule
module module_2 (
    input tri1 id_0,
    input tri0 id_1,
    input wire id_2
);
  assign id_4 = id_0;
  module_0 modCall_1 ();
endmodule
module module_3 ();
  always
  fork
    $display(1, id_1);
    if ((1)) begin : LABEL_0
      @(*) id_1 = id_1;
    end else id_1 <= #1 1;
    id_1 = id_1;
    id_1 <= 1;
    id_1 <= 1;
  join_none
endmodule
