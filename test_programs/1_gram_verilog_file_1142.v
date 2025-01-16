// Seed: 3112481674
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  supply1 id_8 = -1'b0;
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
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  nor primCall (id_6, id_3, id_1);
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_4,
      id_1,
      id_3,
      id_5
  );
endmodule
