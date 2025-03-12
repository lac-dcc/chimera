// Seed: 3957177665
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    input tri0 id_2,
    output supply1 id_3,
    output tri0 id_4,
    output wire id_5
);
  assign id_5 = {id_2{-1}};
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    output tri1  id_1,
    input  uwire id_2,
    input  wire  id_3,
    output tri0  id_4,
    input  uwire id_5,
    output tri0  id_6,
    output tri0  id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_5,
      id_0,
      id_4,
      id_1
  );
  assign id_7 = -1;
endmodule
