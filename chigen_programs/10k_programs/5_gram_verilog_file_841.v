// Seed: 3978227387
module module_0 (
    output tri0 id_0,
    input wand id_1,
    output uwire id_2,
    input supply1 id_3,
    output tri id_4,
    input supply1 id_5,
    output tri id_6,
    input tri0 id_7
);
  id_9(
      .id_0({id_5{1'd0}}), .id_1(id_3 > 1), .id_2(1)
  );
endmodule
module module_1 (
    output wor id_0,
    input tri0 id_1,
    inout supply1 id_2,
    input tri1 id_3
);
  wire id_5;
  nor (id_0, id_1, id_2, id_3);
  module_0(
      id_0, id_3, id_2, id_3, id_0, id_1, id_0, id_1
  );
endmodule
