// Seed: 3086679265
module module_0 (
    output supply1 id_0,
    input wand id_1,
    input wire id_2,
    output wand id_3,
    input tri id_4,
    output tri1 id_5,
    output wor id_6
);
  module_2 modCall_1 ();
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    output wire id_0,
    input  wire id_1,
    input  wire id_2,
    output wire id_3,
    input  tri0 id_4,
    input  wor  id_5
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3
  );
  logic [7:0] id_7;
  wire id_8, id_9;
endmodule
module module_2 ();
  always @((id_1)) begin : LABEL_0
    id_1 <= 1'd0;
    $display(id_1);
  end
  assign module_0.id_5 = 0;
  wire id_2;
endmodule
