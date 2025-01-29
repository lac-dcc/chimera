// Seed: 2611982837
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
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = id_1;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  wire id_3, id_4, id_5;
  id_6(
      id_2
  );
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2,
      id_3,
      id_4,
      id_5
  );
endmodule
module module_2;
  assign id_1 = -1 % id_1;
  wire id_2, id_3, id_4;
endmodule
