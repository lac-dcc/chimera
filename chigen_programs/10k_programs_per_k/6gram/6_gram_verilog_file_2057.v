// Seed: 762227377
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
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always disable id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output logic [7:0] id_6;
  nor primCall (id_2, id_7, id_1, id_9, id_4, id_5, id_8);
  inout wire id_5;
  inout wire id_4;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_5,
      id_9,
      id_4,
      id_4,
      id_8,
      id_7
  );
  assign modCall_1.id_9 = 0;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_6[1'b0] = id_5;
endmodule
