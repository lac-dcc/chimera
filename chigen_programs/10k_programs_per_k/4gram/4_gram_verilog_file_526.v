// Seed: 2798697724
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
  inout wire id_10;
  inout wire id_9;
  inout supply0 id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_8 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    .id_8(id_3),
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout logic [7:0] id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_4,
      id_1,
      id_4,
      id_2,
      id_2,
      id_4,
      id_4,
      id_4
  );
  inout wire id_1;
  assign id_5[-1'b0] = -1;
  or primCall (id_4, id_1, id_6, id_7, id_2, id_3, id_8, id_5);
endmodule
