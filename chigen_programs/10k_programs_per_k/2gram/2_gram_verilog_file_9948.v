// Seed: 3394003379
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input tri1 id_3,
    output wor id_4,
    input tri id_5
);
  localparam id_7 = 1;
  assign module_1.id_3 = 0;
  wire id_8;
endmodule
module module_1 (
    output wor id_0,
    output tri id_1,
    input tri0 id_2,
    input supply1 id_3,
    input uwire id_4,
    output tri1 id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_2,
      id_5,
      id_3
  );
endmodule
module module_2 (
    output tri id_0,
    output uwire id_1,
    inout supply1 id_2,
    output tri id_3,
    output supply1 id_4,
    output tri id_5,
    input wire id_6,
    input wand id_7,
    input supply1 id_8,
    input tri1 id_9,
    input tri id_10
);
  wire id_12;
  assign id_2 = 1;
  or primCall (id_4, id_7, id_2, id_12, id_10, id_6);
  wire id_13;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_8,
      id_7,
      id_2,
      id_9
  );
  assign modCall_1.id_1 = 0;
endmodule
