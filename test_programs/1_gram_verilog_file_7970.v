// Seed: 3502379942
module module_0;
  id_1(
      -1, id_2, id_2, id_2, 1'b0, -1'b0, id_2
  );
endmodule
module module_1 (
    output uwire id_0,
    input  wor   id_1,
    input  wor   id_2,
    output uwire id_3,
    output tri   id_4
);
  wire id_6;
  assign id_0 = id_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1
);
  input wire id_1;
  module_0 modCall_1 ();
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = 1'b0;
  xnor primCall (id_2, id_4, id_5, id_6, id_9);
  id_9(
      id_2, id_8, 1
  );
  module_0 modCall_1 ();
  wire id_10;
  assign id_9 = id_1;
  always @(posedge 1) id_2 <= #1 -1 || -1;
endmodule
