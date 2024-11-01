// Seed: 747327742
module module_0 (
    input tri0 id_0,
    output wand id_1,
    input supply0 id_2,
    input wire id_3,
    input uwire id_4,
    output supply0 id_5,
    input wor id_6,
    input wand id_7,
    input supply1 id_8,
    input uwire id_9
    , id_13,
    input wand id_10,
    output tri0 id_11
);
  tri1 id_14;
  assign id_5 = 1;
  generate
    for (id_15 = 1; id_15; id_14 = id_3 >= 1) begin : id_16
      id_17(
          .id_0(1), .id_1(1), .id_2(id_5), .id_3(id_13), .id_4(1'b0)
      );
    end
  endgenerate
endmodule
module module_1 (
    input  tri1  id_0,
    output uwire id_1,
    input  tri0  id_2,
    input  wand  id_3
);
  wire id_5;
  module_0(
      id_3, id_1, id_2, id_3, id_3, id_1, id_0, id_0, id_3, id_2, id_2, id_1
  );
endmodule
