// Seed: 3408481240
module module_0 (
    output tri0 id_0,
    input  tri0 id_1
);
  wire id_3;
  xor primCall (id_0, id_1, id_3);
  module_2 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_0
  );
  struct packed {
    logic id_4;
    logic id_5;
  } id_6;
endmodule
module module_1 (
    output tri1 id_0,
    input supply1 id_1,
    output wand id_2
);
  logic id_4;
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  assign modCall_1.id_1 = 0;
  parameter id_5 = 1;
  wire id_6;
endmodule
module module_2 (
    input tri0 id_0,
    output tri0 id_1,
    input supply1 id_2,
    output uwire id_3
);
  assign id_3 = 1 == id_2;
  wire id_5;
  if (1) wire id_6, id_7;
  else begin : LABEL_0
    assign id_1 = 1;
  end
  assign id_7 = id_7;
endmodule
