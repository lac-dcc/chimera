// Seed: 3649990924
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
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  buf primCall (id_3, id_4);
  module_0 modCall_1 (
      id_5,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4,
      id_1
  );
  output wire id_2;
  input wire id_1;
  logic [1 : -1] id_6;
  ;
  logic id_7;
endmodule
