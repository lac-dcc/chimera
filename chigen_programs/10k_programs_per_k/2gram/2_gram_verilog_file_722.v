// Seed: 4259020318
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_6 = id_3;
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
  output wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2,
      id_1,
      id_4,
      id_5
  );
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_5 = 1 & 1'b0 & id_3;
  assign id_1 = id_1;
  assign id_5 = id_3 === id_6;
  parameter id_7 = (1);
endmodule
