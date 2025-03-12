// Seed: 1777366738
program module_0 (
    input  wor   id_0,
    input  tri0  id_1,
    input  uwire id_2
    , id_5,
    output uwire id_3
);
  wire id_6;
  module_2 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_1,
      id_0,
      id_2,
      id_3
  );
  assign modCall_1.id_2 = 0;
endprogram
module module_1 (
    output logic id_0,
    input  tri1  id_1,
    output tri0  id_2
);
  always @(posedge (id_1 + -1)) id_0 <= id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_1 = 0;
  assign id_2 = 1;
  assign id_0 = id_1;
endmodule
module module_2 (
    input tri0 id_0,
    input wor id_1,
    output tri0 id_2,
    input supply0 id_3,
    input tri0 id_4,
    input wand id_5,
    output supply0 id_6
);
  assign id_2 = id_1 ? 1 : id_0;
endmodule
