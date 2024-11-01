// Seed: 3708721747
module module_0 (
    input  uwire id_0,
    input  uwire id_1,
    input  uwire id_2,
    input  wor   id_3,
    output wor   id_4
);
  assign id_4 = 1 - ~id_0 ? 1 != 1 : 1 ? id_3 : id_0;
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    output uwire id_2
);
  wire id_4;
  wire id_5;
  module_0(
      id_0, id_0, id_0, id_0, id_2
  );
  always @(id_5 or id_4) id_5 = id_4;
  always_latch disable id_6;
endmodule
