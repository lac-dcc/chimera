// Seed: 3601397280
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2
  );
  inout wire id_2;
  output wire id_1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output tri1 id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_5
  );
  input wire id_2;
  xor primCall (id_5, id_3, id_1, id_2);
  input wire id_1;
  assign id_4 = -1;
endmodule
