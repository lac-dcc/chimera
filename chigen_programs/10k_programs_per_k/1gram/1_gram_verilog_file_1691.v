// Seed: 3349693368
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = id_8;
  union packed {logic id_9;} id_10;
  parameter id_11 = 1;
  logic id_12;
  assign {1, id_10.id_9, -1} = -1;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3
  );
endmodule
