// Seed: 1225436275
module module_0 ();
  wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  logic [7:0] id_5;
  always @(posedge 1) begin : LABEL_0
    id_2 <= #1 id_5[1];
    id_4 <= id_3;
    $display();
  end
  wire id_6;
  module_0 modCall_1 ();
  wire id_7;
endmodule
module module_2 (
    output tri0 id_0,
    input  tri  id_1,
    output wand id_2
);
  wire id_4;
  wire id_5;
  wire id_6 = id_1;
  assign module_3.type_0 = 0;
endmodule
module module_3 (
    input  tri1 id_0,
    output wor  id_1
    , id_4,
    input  wand id_2
);
  always @(1 or negedge id_4) begin : LABEL_0
    assume (1);
  end
  module_2 modCall_1 (
      id_1,
      id_2,
      id_1
  );
endmodule
