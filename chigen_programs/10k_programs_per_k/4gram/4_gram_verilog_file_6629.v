// Seed: 3142429415
module module_0 (
    output uwire id_0,
    output tri1  id_1
);
  specify
    (id_3 *> id_4) = (-1  : 1  : -1, id_4);
    (id_5[1] => id_6) = (id_4, 1);
    specparam id_7 = id_5;
  endspecify
  logic id_8;
  ;
  assign module_1.id_0 = 0;
  logic [1 : -1] id_9;
  module_2 modCall_1 (id_4);
  wire id_10;
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_1,
      id_1
  );
  wire id_3;
endmodule
module module_2 (
    id_1
);
  input wire id_1;
  wire id_2;
  assign module_0.id_1 = 0;
endmodule
