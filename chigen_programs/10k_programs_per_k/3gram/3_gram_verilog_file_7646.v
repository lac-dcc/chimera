// Seed: 2333195736
module module_0 (
    output uwire id_0,
    input  tri   id_1
);
  wire id_3 = id_1;
  module_2 modCall_1 (
      id_3,
      id_1
  );
  assign modCall_1.id_1 = 0;
  assign module_1.id_3  = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input wand id_2,
    output wor id_3,
    output tri0 id_4,
    output wand id_5
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_3,
      id_2
  );
endmodule
module module_2 (
    input supply0 id_0,
    input supply1 id_1
);
  always @(posedge 1)
  fork
    id_3 <= 1;
    $display(id_1);
  join
  module_3 modCall_1 (
      id_0,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_3 (
    input wire id_0
    , id_3,
    input tri  id_1
);
  timeprecision 1ps;
  assign id_3 = 1'h0;
endmodule
