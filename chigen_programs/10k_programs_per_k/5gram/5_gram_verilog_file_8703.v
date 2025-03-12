// Seed: 669442202
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign module_1.id_1 = 0;
  parameter id_4 = 1;
  wire id_5;
endmodule
module module_1 (
    output tri1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    output tri id_3,
    input uwire id_4,
    output tri1 id_5,
    input tri0 id_6,
    input supply1 id_7,
    output tri0 id_8,
    input supply0 id_9
);
  nor primCall (id_0, id_2, id_11, id_4, id_6, id_9);
  wire id_11;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11
  );
  assign id_0 = 1 ? id_11 : 1;
endmodule
