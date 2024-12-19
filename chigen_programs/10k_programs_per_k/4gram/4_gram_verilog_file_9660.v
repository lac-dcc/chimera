// Seed: 3124061337
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_7;
  assign module_1.type_7 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output wor id_1,
    input tri1 id_2,
    output wor id_3
);
  wire id_5, id_6;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_5
  );
endmodule
module module_2;
  logic [7:0] id_1, id_2;
  wire id_3;
  assign id_2[1] = 1;
endmodule
module module_3 (
    input  tri1  id_0,
    output tri0  id_1,
    input  uwire id_2,
    input  tri0  id_3,
    output uwire id_4,
    output wire  id_5,
    output tri0  id_6,
    input  uwire id_7,
    input  wire  id_8,
    input  uwire id_9,
    output uwire id_10,
    input  wor   id_11
);
  generate
    always_latch @(1 or id_2) begin : LABEL_0
      assume (id_3);
    end
  endgenerate
  or primCall (id_1, id_11, id_2, id_3, id_7, id_8, id_9);
  module_2 modCall_1 ();
endmodule
