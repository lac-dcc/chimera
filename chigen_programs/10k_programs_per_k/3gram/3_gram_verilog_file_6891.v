// Seed: 3021645279
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
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always @(1 or id_6);
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  specify
    (id_3 => id_4) = (1, id_4);
    (id_5 => id_6) = (1  : 'b0 : id_6);
  endspecify
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2,
      id_3,
      id_4,
      id_5,
      id_5,
      id_3
  );
  tri1 id_7 = id_3;
endmodule
