// Seed: 2163134500
module module_0 (
    input wire id_0,
    output tri1 id_1,
    output tri0 id_2,
    output supply0 id_3,
    output tri1 id_4,
    input tri0 id_5,
    output tri id_6,
    input tri1 id_7,
    input tri0 id_8,
    output wand id_9,
    input supply1 id_10,
    input supply1 id_11,
    output supply1 id_12
);
  id_14(
      .id_0({id_1, 1, 1'd0} - id_4), .id_1(id_7), .id_2(id_10), .id_3(id_4)
  );
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input wire id_1,
    input tri1 id_2
);
  wire  id_4;
  wire  id_5;
  uwire id_6 = 1'b0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_0
  );
  always @(negedge 1) id_0 = 1'b0;
endmodule
