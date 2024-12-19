// Seed: 3498449600
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  wire id_2;
  wire id_3;
  assign {1'b0, 1 | 1'b0} = 1;
  xor primCall (id_1, id_2, id_3);
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4
  );
endmodule
module module_2 ();
  assign module_3.type_0 = 0;
  always begin : LABEL_0
    disable id_1;
  end
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
endmodule
module module_3 (
    output wire id_0
);
  module_2 modCall_1 ();
endmodule
module module_4 (
    output uwire id_0,
    output tri id_1,
    input wand id_2,
    input tri1 id_3,
    input supply1 id_4,
    input logic id_5
);
  logic id_7;
  assign id_0 = 1;
  assign id_1 = 1;
  wire id_8;
  and primCall (id_0, id_2, id_8);
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8
  );
  assign id_1 = 1'b0;
  id_9 :
  assert property (@(posedge id_4 ? id_5 : id_7) 1 * 1)
  else id_7 <= "";
  wire id_10;
endmodule
