// Seed: 134202693
module module_0 (
    input  tri0  id_0,
    output tri0  id_1,
    output tri1  id_2,
    output tri0  id_3,
    input  uwire id_4
);
  assign id_2 = 1'b0;
  tri1 id_6, id_7, id_8;
  id_9(
      .id_0(1), .id_1(id_3 * id_3), .id_2(id_7)
  );
  assign id_8 = id_4;
endmodule
module module_1 (
    output tri0 id_0,
    input tri1 id_1,
    output uwire id_2,
    input wire id_3,
    input wire id_4,
    output wand id_5,
    output tri0 id_6,
    output supply0 id_7,
    output tri0 id_8,
    input tri1 id_9,
    output tri id_10,
    output tri0 id_11
);
  module_0 modCall_1 (
      id_4,
      id_10,
      id_8,
      id_5,
      id_1
  );
  always @(negedge 1'b0) begin : LABEL_0
    id_6 += id_9;
  end
endmodule
