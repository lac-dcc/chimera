// Seed: 2960925789
module module_0 (
    output wand id_0
    , id_7,
    output supply0 id_1,
    input supply1 id_2,
    input wire id_3,
    input supply0 id_4,
    input tri1 id_5
    , id_8
);
  assign id_1 = id_2;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output wire id_0,
    output supply1 id_1,
    output supply0 id_2,
    output supply0 id_3,
    input wire id_4
);
  assign id_1 = id_4;
  generate
    integer id_6;
  endgenerate
  always_latch @(posedge id_4) @(negedge id_4 or 1);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_4,
      id_4,
      id_4
  );
  `define pp_7 0
  parameter id_8 = 1;
  always begin : LABEL_0
    id_6 = 1;
  end
  assign id_0 = `pp_7[1];
  wire id_9;
endmodule
