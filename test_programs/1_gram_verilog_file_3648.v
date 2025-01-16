// Seed: 2961505326
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
    id_10
);
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  initial id_1 = -1'b0;
  assign module_1.id_1 = 0;
  wire id_11;
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    output logic id_2
);
  xnor primCall (id_2, id_1, id_4, id_0, id_7);
  genvar id_4;
  always id_2 = new;
  wire id_5;
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_4,
      id_6,
      id_4,
      id_6,
      id_5,
      id_6,
      id_6
  );
endmodule
