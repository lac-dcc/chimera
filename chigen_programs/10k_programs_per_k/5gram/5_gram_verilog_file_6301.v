// Seed: 1969763936
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
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_8;
  assign module_1.id_1 = 0;
endmodule
module module_1;
  assign id_1 = {id_1, 1};
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  wire id_3;
endmodule
module module_2 (
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
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  or primCall (id_2, id_7, id_1, id_4);
  module_0 modCall_1 (
      id_3,
      id_6,
      id_7,
      id_7,
      id_7,
      id_7,
      id_6
  );
endmodule
