// Seed: 2472953697
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8 = id_7;
  assign module_1.id_0 = 0;
  wire id_9;
endmodule
module module_1 (
    output tri0 id_0,
    input wor id_1,
    output tri1 id_2,
    input supply1 id_3,
    input tri id_4,
    output tri0 id_5,
    input supply0 id_6,
    output tri0 id_7,
    output wand id_8,
    input wire id_9,
    input wire id_10
);
  or primCall (id_7, id_9, id_10, id_4, id_12, id_13, id_1, id_6, id_3);
  id_12(
      .id_0(1'b0), .id_1(1), .id_2(!1'b0)
  );
  wire id_13;
  assign id_5 = id_6;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13
  );
  assign id_2 = id_3;
endmodule
