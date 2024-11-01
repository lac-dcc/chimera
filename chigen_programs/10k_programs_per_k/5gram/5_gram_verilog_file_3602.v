// Seed: 3695752349
module module_0 (
    output tri id_0,
    output tri1 id_1,
    input wor id_2,
    input uwire id_3,
    input supply0 id_4,
    input wire id_5,
    input wor id_6,
    input supply1 id_7,
    input uwire id_8
);
  assign id_1 = 1;
endmodule
module module_1 (
    input tri id_0,
    output tri1 id_1,
    input uwire id_2,
    input wire id_3,
    input supply0 id_4,
    input wand id_5,
    output tri0 id_6,
    output wor id_7,
    output wand id_8,
    input tri0 id_9,
    input supply1 id_10
);
  id_12(
      .id_0(1'd0 - id_10), .id_1(id_6)
  );
  always_comb @(posedge 1)
    if (id_0) begin
      id_7 = 1;
    end
  wire id_13 = 1 == id_3 > 1;
  module_0(
      id_8, id_7, id_5, id_5, id_2, id_9, id_9, id_10, id_10
  );
  wire id_14;
  assign id_8 = id_3 ? id_0 : 1;
  nor (id_6, id_12, id_4, id_3, id_9, id_2, id_13, id_5, id_0);
  assign id_13 = id_2 ? id_13 : 1;
endmodule
