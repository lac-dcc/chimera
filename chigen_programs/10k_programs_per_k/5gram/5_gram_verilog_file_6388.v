// Seed: 4200169799
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic [1 : 1] id_8;
  logic id_9;
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  xnor primCall (id_3, id_2, id_4, id_1);
  inout wire id_2;
  input wire id_1;
  wire id_4;
  ;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_4,
      id_3,
      id_4,
      id_2
  );
endmodule
