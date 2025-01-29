// Seed: 1701361743
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 (
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
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  id_10(
      .id_0(id_7), .sum(~-1)
  );
  or primCall (id_5, id_12, id_7, id_9, id_11, id_6, id_3, id_10, id_1);
  wire id_11, id_12;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_9,
      id_12,
      id_6,
      id_12
  );
endmodule
