// Seed: 3942886916
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
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign module_1.id_6 = 0;
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
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_8 = {id_2, id_6, 1, id_7 + {1{!id_7}}, 1, 1};
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_9,
      id_6,
      id_4,
      id_7
  );
endmodule
