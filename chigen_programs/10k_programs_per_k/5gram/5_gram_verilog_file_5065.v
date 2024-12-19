// Seed: 1315461650
module module_0;
  wire id_1;
  module_3 modCall_1 ();
  timeprecision 1ps;
endmodule
module module_1 ();
  always @(id_1) begin : LABEL_0
    fork
      $display(id_1);
      id_2(1);
    join_any
  end
  module_0 modCall_1 ();
  wire id_3;
  wire id_4;
  wire id_5;
  assign id_4 = id_1;
endmodule
module module_2;
  wire id_1;
  module_0 modCall_1 ();
endmodule
module module_3 ();
  wire id_1;
  module_4 modCall_1 ();
endmodule
module module_4;
  initial begin : LABEL_0
    id_1 <= id_1;
  end
  wire id_3;
endmodule
module module_5 (
    output tri  id_0,
    output tri0 id_1,
    output wor  id_2,
    output tri1 id_3,
    input  tri1 id_4,
    output wire id_5,
    input  wor  id_6
);
endmodule
module module_6 (
    input supply1 id_0,
    output tri id_1,
    input tri1 id_2,
    output tri0 id_3,
    input wire id_4,
    input wand id_5
);
  assign id_3 = 1;
  module_5 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_1,
      id_0,
      id_3,
      id_4
  );
  assign modCall_1.type_2 = 0;
endmodule
