// Seed: 668023592
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    output wire id_2,
    input tri0 id_3,
    output supply0 id_4
);
  assign module_1.type_5 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input wire id_1,
    input supply0 id_2,
    output tri1 id_3
);
  assign id_3 = -id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_2,
      id_3
  );
endmodule
module module_2 (
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
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_9 = 1;
endmodule
module module_3 (
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
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_10;
  nor primCall (id_2, id_10, id_8, id_1, id_6, id_3, id_9, id_7);
  module_2 modCall_1 (
      id_2,
      id_6,
      id_10,
      id_9,
      id_5,
      id_6,
      id_7,
      id_10,
      id_10
  );
endmodule
