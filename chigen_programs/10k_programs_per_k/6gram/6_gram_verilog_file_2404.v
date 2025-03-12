// Seed: 669423086
module module_0 (
    output wand id_0,
    output tri1 id_1,
    input wor id_2,
    output wire id_3,
    input wand id_4,
    input supply0 id_5,
    output wor id_6
);
  logic id_8;
  ;
  wire id_9;
  wire id_10;
  parameter id_11 = {1};
  assign module_1.id_4 = 0;
  uwire id_12;
  assign id_12 = id_10 ? -1'b0 == id_11 : id_2;
  assign id_8[1'b0] = !id_8;
endmodule
module module_1 (
    output supply0 id_0,
    input uwire id_1,
    input supply0 id_2,
    input tri1 id_3,
    output supply0 id_4,
    input tri id_5
);
  assign id_4 = -1;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_2,
      id_4,
      id_2,
      id_3,
      id_4
  );
endmodule
