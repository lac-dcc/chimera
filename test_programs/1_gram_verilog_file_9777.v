// Seed: 4076766595
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input wor id_2,
    input wand id_3,
    input supply1 id_4,
    input supply0 id_5
);
  supply1 id_7 = 1, id_8;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  tri   id_1,
    input  wand  id_2,
    input  wor   id_3,
    input  wor   id_4,
    input  uwire id_5,
    output uwire id_6,
    input  uwire id_7,
    input  uwire id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_8,
      id_4,
      id_5
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
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_12 = id_3;
  wire id_14;
  supply0 id_15;
  wire id_16, id_17, id_18;
  assign id_15 = id_13[-1] - -1;
  wire id_19;
endmodule
module module_3 (
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
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_4[-1];
  xnor primCall (id_5, id_1, id_2, id_4, id_6);
  id_7(
      id_2, -1
  );
  module_2 modCall_1 (
      id_1,
      id_6,
      id_6,
      id_1,
      id_6,
      id_1,
      id_2,
      id_2,
      id_3,
      id_6,
      id_1,
      id_2,
      id_4
  );
endmodule
