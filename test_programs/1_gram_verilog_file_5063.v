// Seed: 4157548451
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  supply1 id_6 = {id_1 && -1, 1, 1};
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_1
  );
  assign id_2 = id_5 & -1;
  always @(*) id_2 <= -1;
endmodule
