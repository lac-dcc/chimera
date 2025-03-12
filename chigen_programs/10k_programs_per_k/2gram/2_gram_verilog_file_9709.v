// Seed: 3659826063
module module_0 (
    output supply0 id_0,
    output tri1 id_1,
    input wand id_2,
    output supply1 id_3,
    input supply0 id_4
);
  assign id_3 = id_2;
  assign module_2.id_1 = 0;
  assign id_1 = -1;
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    input uwire id_2,
    output supply1 id_3,
    output supply1 id_4
);
  assign id_3 = id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    input  wand  id_0,
    output uwire id_1,
    inout  logic id_2
);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1,
      id_0
  );
  always begin : LABEL_0
    id_2 <= id_0;
  end
endmodule
