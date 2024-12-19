// Seed: 733845303
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  assign id_1 = id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3
  );
  wire id_5 = id_2;
  assign id_1[1] = 1'b0;
  wire id_6;
  wire id_7;
  buf primCall (id_3, id_2);
  assign id_5 = id_3;
endmodule
