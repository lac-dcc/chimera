// Seed: 1981753514
module module_0 (
    input uwire id_0,
    output uwire id_1,
    output supply0 id_2,
    input supply1 id_3,
    input wand id_4
);
  wire id_6 = ~id_3;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    output wor id_2,
    output uwire id_3,
    input wor id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_4,
      id_0
  );
endmodule
module module_2 (
    input  wire  id_0,
    output uwire id_1
    , id_4,
    output tri   id_2
);
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.id_1 = 0;
  assign id_1 = id_5;
endmodule
