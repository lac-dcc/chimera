// Seed: 4155953130
module module_0 (
    input wor id_0,
    input supply1 id_1,
    output tri0 id_2,
    output tri1 id_3,
    input tri id_4,
    input tri1 id_5,
    input wor id_6
);
  reg id_8;
  always_ff begin : LABEL_0
    id_8 = 1;
    `define pp_9 0
    id_8 <= id_1 - 1;
    id_8 <= 1'd0;
  end
  assign id_3 = id_6 - id_4;
  uwire id_10;
  assign id_10 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    output supply0 id_2,
    output supply0 id_3,
    output uwire id_4,
    output tri id_5
    , id_9,
    input wor id_6,
    input tri1 id_7
);
  supply1 id_10 = id_0;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_4,
      id_1,
      id_0,
      id_0,
      id_6
  );
  assign modCall_1.id_10 = 0;
endmodule
