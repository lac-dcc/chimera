// Seed: 1841922250
module module_0 (
    output tri1 id_0,
    input wor id_1,
    input supply1 id_2,
    output supply1 id_3,
    input wand id_4,
    input tri1 id_5,
    input supply0 id_6
);
  wire id_8;
  or primCall (id_0, id_1, id_5, id_2, id_8, id_6, id_4);
  module_2 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0
  );
  assign modCall_1.id_2 = 0;
  assign module_1.id_6  = 0;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    output wire id_2,
    input tri0 id_3
    , id_6,
    output supply0 id_4
);
  assign id_4 = 1;
  initial begin : LABEL_0
    id_2 = 1;
    id_6 <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_4,
      id_0,
      id_3,
      id_3
  );
endmodule
module module_2 (
    input tri0 id_0,
    input supply0 id_1,
    input tri1 id_2,
    output wand id_3
);
  wire id_5;
  wire id_6;
  initial assume (id_2);
  assign id_6 = 1;
endmodule
