// Seed: 630003742
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
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout logic [7:0] id_6;
  inout wire id_5;
  inout wire id_4;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_3,
      id_2,
      id_5,
      id_4,
      id_5
  );
  output wire id_3;
  output supply0 id_2;
  output wire id_1;
  assign id_6[1'd0] = id_4;
  assign id_2 = 1;
endmodule
