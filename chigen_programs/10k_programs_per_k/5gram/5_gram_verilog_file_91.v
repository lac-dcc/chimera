// Seed: 2010911311
module module_0 (
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
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_6[1] = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout logic [7:0] id_3;
  input wire id_2;
  output tri1 id_1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_2,
      id_6,
      id_6,
      id_3
  );
  assign id_1 = 1 ? id_3 : id_3[-1] ? id_3[-1'd0] == id_2 : id_2;
endmodule
