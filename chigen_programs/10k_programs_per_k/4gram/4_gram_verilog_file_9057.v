// Seed: 666093338
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  wire id_3;
  wire id_4;
  wire id_5, id_6;
endmodule
module module_1 (
    input supply0 id_0,
    input wand id_1,
    output wand id_2,
    input wor id_3
    , id_7,
    input wor id_4,
    output tri0 id_5
);
  wire id_8;
  wire id_9;
  generate
    assign id_2 = id_7;
  endgenerate
  xnor primCall (id_2, id_7, id_0, id_8, id_4);
  module_0 modCall_1 (
      id_8,
      id_9
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  always_latch @(1 && id_5) id_3 = (id_2);
  module_0 modCall_1 (
      id_2,
      id_6
  );
  assign id_8 = "";
endmodule
