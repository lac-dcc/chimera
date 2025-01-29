// Seed: 3213799356
module module_0 (
    input tri id_0,
    input supply0 id_1,
    output supply1 id_2,
    output wand id_3,
    input tri0 id_4,
    output tri0 id_5,
    input supply0 id_6,
    input uwire id_7,
    input tri id_8,
    output tri id_9
);
  assign id_9 = -1;
  wire id_11;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    input wand id_2,
    input supply1 id_3,
    input tri1 id_4
);
  initial if (id_4) $display;
  parameter id_6 = -1;
  uwire id_7 = 1 !== id_1;
  assign id_0 = id_4 ? id_2 : id_2;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_0,
      id_3,
      id_0,
      id_1,
      id_1,
      id_2,
      id_0
  );
endmodule
