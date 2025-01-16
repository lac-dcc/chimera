// Seed: 1551523469
program module_0 (
    output uwire id_0,
    input  tri0  id_1
);
  assign module_1.type_3 = 0;
  always id_0 = 1;
endmodule
module module_1 (
    input  uwire id_0,
    input  wand  id_1,
    input  tri1  id_2,
    input  wor   id_3,
    output tri1  id_4,
    input  tri0  id_5
);
  wire id_7;
  or primCall (id_4, id_5, id_0, id_7, id_3);
  wire id_9;
  parameter id_10 = -1;
  module_0 modCall_1 (
      id_4,
      id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wor id_5;
  id_6(
      (id_4) == 1, -1, 1'h0, 1
  );
  if (id_5) begin : LABEL_0
    wire id_7;
  end else wire id_8;
  wire id_9;
  wor  id_10 = id_5;
  wand id_11;
  assign id_8  = id_2;
  assign id_10 = id_11;
endmodule
module module_3;
  wire id_1;
  wire id_2;
  wire id_3;
  parameter id_4 = 1;
  wire id_5, id_6;
  module_2 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2
  );
  supply0 id_7, id_8;
  wire id_9;
  assign id_7 = -1;
endmodule
