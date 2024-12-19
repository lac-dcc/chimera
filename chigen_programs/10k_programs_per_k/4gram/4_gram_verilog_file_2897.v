// Seed: 3438909538
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input supply1 id_2,
    input supply0 id_3,
    output supply1 id_4
);
  assign id_4 = id_3;
  assign module_1.id_3 = 0;
  wire id_6;
  assign module_2.id_6 = 0;
endmodule
module module_1 (
    output tri1 id_0
    , id_6,
    input wire id_1,
    output wire id_2,
    input supply1 id_3,
    input tri id_4
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_3,
      id_1,
      id_0
  );
endmodule
module module_2 (
    input uwire id_0,
    output supply0 id_1,
    output uwire id_2,
    input uwire id_3,
    input wor id_4
);
  wor id_6;
  final $display();
  assign id_1 = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_3,
      id_2
  );
  always_latch @(1 or id_4 & id_6) $display;
endmodule
