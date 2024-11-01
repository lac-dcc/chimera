// Seed: 812509040
module module_0 (
    output uwire id_0,
    input tri1 id_1,
    output uwire id_2,
    output supply0 id_3,
    input wor id_4,
    input wand id_5,
    output tri0 id_6,
    input wand id_7,
    input supply0 id_8,
    input tri id_9,
    input wand id_10
);
  id_12(
      .id_0(id_4), .id_1(id_8), .id_2(), .id_3(1), .id_4(), .id_5(!id_4)
  );
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    output tri id_2,
    input supply1 id_3
);
  logic [7:0] id_5;
  module_0(
      id_2, id_3, id_2, id_2, id_3, id_1, id_2, id_0, id_3, id_0, id_1
  );
  assign id_5 = id_5#(1'b0) [1'h0];
endmodule
