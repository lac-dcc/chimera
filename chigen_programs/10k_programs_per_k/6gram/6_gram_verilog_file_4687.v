// Seed: 1489377029
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_5,
      id_1
  );
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output reg id_2;
  nor primCall (id_1, id_6, id_3, id_5);
  inout wire id_1;
  initial id_2 = #1 id_1;
endmodule
