// Seed: 175759764
module module_0 (
    input tri0 id_0,
    input tri1 id_1
);
  wire id_3;
  assign module_2.type_1 = 0;
  assign module_1.id_6   = 0;
endmodule
module module_1 (
    input wire id_0,
    output logic id_1,
    input wire id_2,
    input wire id_3,
    input tri0 id_4,
    output supply0 id_5,
    input tri1 id_6
);
  always
  fork
    id_1 <= 1;
  join
  module_0 modCall_1 (
      id_3,
      id_2
  );
endmodule
module module_2 (
    input uwire id_0,
    input supply1 id_1,
    input supply1 id_2,
    output wire id_3,
    output supply0 id_4
);
  assign id_4 = id_0;
  wire id_6, id_7;
  module_0 modCall_1 (
      id_0,
      id_1
  );
  wire id_8;
endmodule
