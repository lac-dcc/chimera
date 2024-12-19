// Seed: 2591762736
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = 1;
  assign module_2.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_7 = id_4;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_7
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    output wand  id_0,
    input  uwire id_1,
    input  tri0  id_2
);
  id_4(
      .id_0(id_0), .id_1(id_2)
  );
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5
  );
endmodule
