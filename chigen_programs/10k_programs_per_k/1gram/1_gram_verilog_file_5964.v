// Seed: 405990018
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  nor (id_6, id_5, id_3, id_2);
  module_2(
      id_3, id_6
  );
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = 1;
  module_0(
      id_4, id_4, id_4, id_3, id_4, id_4
  );
  tri1 id_5 = 1;
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  always id_2 = 1;
endmodule
