// Seed: 2616004742
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    output tri0 id_2,
    input wire id_3,
    output supply0 id_4,
    output tri1 id_5,
    input wand id_6,
    output supply1 id_7,
    input wor id_8
);
  logic id_10;
  assign module_1.id_5 = 0;
  assign id_4 = id_3;
endmodule
module module_1 (
    input tri1 id_0,
    input uwire id_1,
    input wire id_2,
    output tri0 id_3,
    input uwire id_4,
    output logic id_5,
    input uwire id_6,
    input supply0 id_7,
    input wand id_8
    , id_12,
    input supply1 id_9,
    input tri0 id_10
);
  always #(1) id_5 = -1'b0;
  xnor primCall (id_5, id_10, id_2, id_7, id_4, id_8, id_0, id_9);
  module_0 modCall_1 (
      id_10,
      id_3,
      id_3,
      id_8,
      id_3,
      id_3,
      id_4,
      id_3,
      id_1
  );
endmodule
