// Seed: 2997491313
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_13 = id_6;
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input wand id_1,
    input wire id_2
);
  wire id_4, id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_4,
      id_5,
      id_4,
      id_5,
      id_5,
      id_5
  );
  assign id_4 = 1'd0 ? ~id_5 : 1;
  assign id_4 = 1 - id_4;
endmodule
