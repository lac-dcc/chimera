// Seed: 3863024587
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    input wor id_2,
    output tri1 id_3,
    input wand id_4,
    output tri id_5,
    input supply1 id_6,
    input wand id_7,
    input uwire id_8,
    output tri1 id_9,
    output supply0 id_10
);
  wire id_12;
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    input wor id_2,
    input wand id_3,
    input supply1 id_4,
    output uwire id_5,
    input logic id_6,
    input supply0 id_7
);
  assign id_5 = 1 ? 1 : 1'd0;
  logic id_9 = id_6;
  initial begin : id_10
    id_9 <= 1;
  end
  module_0(
      id_3, id_1, id_1, id_5, id_3, id_5, id_7, id_1, id_3, id_5, id_5
  );
endmodule
