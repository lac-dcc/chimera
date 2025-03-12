// Seed: 4287982146
module module_0 (
    input wand id_0,
    input tri id_1,
    input uwire id_2,
    output tri0 id_3,
    output supply1 id_4,
    output wand id_5
    , id_9,
    input wand id_6,
    output tri0 id_7
);
  assign id_7 = 1;
  parameter [-1 : -1] id_10 = 1;
  wire [(  1  ) : -1] id_11;
  wire id_12;
  wire id_13;
  logic id_14;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    output tri1 id_2,
    input tri id_3,
    output uwire id_4,
    inout tri0 id_5
);
  assign id_0 = id_3;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_3,
      id_5,
      id_0,
      id_2,
      id_3,
      id_4
  );
  assign modCall_1.id_4 = 0;
endmodule
