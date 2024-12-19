// Seed: 1222624573
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wire id_3,
    input uwire id_4
);
  pulldown (1, id_1, 1'h0 - id_1, id_0);
  assign module_2.id_7 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input supply0 id_1
);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    output supply1 id_0,
    output supply1 id_1,
    output tri1 id_2,
    input supply1 id_3,
    input uwire id_4,
    input supply0 id_5,
    input uwire id_6,
    output tri0 id_7,
    input tri id_8,
    output uwire id_9
);
  assign id_0 = id_4;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_5,
      id_5,
      id_5
  );
endmodule
