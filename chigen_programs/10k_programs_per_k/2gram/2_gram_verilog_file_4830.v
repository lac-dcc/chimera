// Seed: 4258805215
module module_0 (
    output supply1 id_0,
    input wor id_1,
    input wire id_2,
    input tri1 id_3,
    output tri1 id_4,
    input supply0 id_5,
    input tri1 id_6,
    output wor id_7,
    input wor id_8,
    input uwire id_9,
    input supply0 id_10
);
endmodule
module module_1 (
    input tri1 id_0,
    input wire id_1,
    output wor id_2,
    output wire id_3,
    output tri0 id_4,
    input wire id_5,
    input supply0 id_6,
    output wand id_7,
    input wand id_8
);
  assign id_2 = id_8;
  initial begin : LABEL_0
    wait (1);
    $display(1, id_6, 1);
    id_7 = id_6;
    integer id_10;
    disable id_11;
  end
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_8,
      id_7,
      id_1,
      id_5,
      id_7,
      id_0,
      id_5,
      id_1
  );
  assign modCall_1.type_1 = 0;
  id_12(
      .id_0(id_8), .id_1(id_5)
  );
  always begin : LABEL_0
    `define pp_13 0
  end
endmodule
