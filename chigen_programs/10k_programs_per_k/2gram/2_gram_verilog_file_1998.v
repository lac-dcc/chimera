// Seed: 2442303886
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  assign id_1 = ~1'h0;
  supply0 id_8;
  id_9(
      1'h0, 1, (id_8), 1'b0, 1, 1, 1, id_3, id_2
  );
  assign module_1.id_0 = 0;
  wire id_10;
endmodule
module module_1 (
    input  uwire id_0,
    output wor   id_1,
    output wor   id_2,
    output uwire id_3,
    input  tri   id_4
);
  wire id_6;
  or primCall (id_3, id_0, id_6, id_4);
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  wire id_7;
  always_ff $display;
endmodule
