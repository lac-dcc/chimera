// Seed: 1140221754
module module_0 (
    output uwire id_0
);
  assign id_0 = id_2;
endmodule
module module_1 (
    input wor id_0,
    output tri1 id_1,
    output uwire id_2,
    input supply0 id_3,
    output wand id_4
);
  wire id_6;
  and (id_2, id_3, id_6, id_0);
  module_0(
      id_2
  );
endmodule
module module_2 (
    output supply1 id_0,
    output wire id_1,
    output tri1 id_2,
    input supply1 id_3
);
  assign id_1 = id_3;
  module_0(
      id_2
  );
endmodule
module module_3 (
    output uwire id_0,
    output wire id_1,
    output uwire id_2,
    output supply1 id_3
);
  id_5(
      .id_0(id_3), .id_1(id_0)
  ); module_0(
      id_3
  ); id_6(
      ~id_1, id_1, id_0 - id_1
  );
endmodule
