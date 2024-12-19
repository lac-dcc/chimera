// Seed: 1095923435
module module_0 (
    input wor id_0,
    input wand id_1,
    input supply0 id_2,
    input uwire id_3
);
  tri0 id_5;
  wand id_6;
  assign id_5 = 1;
  assign id_6 = id_5;
  wire id_7;
endmodule
module module_1 (
    input wand id_0,
    input tri0 id_1,
    input wire id_2
    , id_6,
    input supply1 id_3,
    input wand id_4
);
  assign id_6 = id_2 % 1 ? 1'd0 : id_6 & (id_2) ? id_3 | id_1 : 1 - {id_1{id_2}};
  uwire id_7;
  assign id_7 = id_1 - id_0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_2
  );
  assign modCall_1.id_5 = 0;
  wire id_8;
  assign id_6 = 1;
endmodule
