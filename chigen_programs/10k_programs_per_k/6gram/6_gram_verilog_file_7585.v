// Seed: 3160252600
module module_0 (
    output tri1  id_0,
    input  uwire id_1,
    input  tri   id_2,
    output tri0  id_3
);
  wire id_5;
  assign id_0 = 1;
  module_2 modCall_1 (
      id_2,
      id_3,
      id_3,
      id_3
  );
  wire id_6;
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    output supply0 id_2,
    input wire id_3,
    input uwire id_4,
    output uwire id_5
);
  assign id_2 = id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input wand id_0,
    output tri1 id_1,
    output wand id_2,
    output supply1 id_3
);
  specify
    (id_5 => id_6) = 1;
    $width(negedge id_7, 1);
    (id_8 => id_9) = (1);
  endspecify
  assign module_0.type_8 = 0;
endmodule
