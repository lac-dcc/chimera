// Seed: 3819876134
module module_0;
  wire id_2;
  wire id_3;
  assign module_3.id_0 = 0;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    id_2 = id_3;
  end
  module_0 modCall_1 ();
  wire id_4;
endmodule
module module_2 (
    output tri1 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input tri0 id_3
);
  wire id_5;
  module_0 modCall_1 ();
endmodule
module module_3 (
    output tri0 id_0,
    input  tri  id_1
);
  uwire id_3;
  wor   id_4;
  tri1  id_5;
  id_6 :
  assert property (@(negedge "" ==? {id_5{1}}) 1)
  else $display(id_3, (id_4), 1'b0);
  module_0 modCall_1 ();
  wire id_7;
endmodule
