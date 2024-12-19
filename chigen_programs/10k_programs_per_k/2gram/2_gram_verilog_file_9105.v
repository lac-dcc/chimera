// Seed: 1478666623
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_8 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign id_1 = id_1[1 : 1'b0];
  wire id_5 = id_3;
  not primCall (id_2, id_1);
endmodule
