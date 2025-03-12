// Seed: 377199009
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  parameter id_7 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4
  );
  input wire id_2;
  output wire id_1;
  wire [-1 'b0 : 1] id_6;
endmodule
