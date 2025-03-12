// Seed: 1645176517
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
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign module_1.id_2 = 0;
  logic id_10 = id_6;
  assign id_7 = id_3 ? id_10[-1 : ""] : id_1;
endmodule
module module_1 (
    output supply0 id_0,
    output supply1 id_1,
    input tri1 id_2,
    output tri0 id_3
);
  wire id_5;
  wire id_6;
  assign id_6 = id_2;
  nor primCall (id_3, id_6, id_5);
  assign id_1 = id_5;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_5,
      id_5,
      id_6
  );
endmodule
