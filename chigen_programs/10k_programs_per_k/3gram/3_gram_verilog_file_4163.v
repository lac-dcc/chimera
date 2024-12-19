// Seed: 1984467298
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri1 id_3,
    input supply1 id_4,
    output uwire id_5,
    input uwire id_6
);
  realtime id_8;
  realtime id_9;
  assign id_9 = (id_8);
endmodule
module module_1 (
    input  tri0  id_0,
    output tri   id_1,
    input  uwire id_2
);
  wire id_4;
  and primCall (id_1, id_4, id_0);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_0 = 0;
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
    id_10
);
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  id_11(
      .id_0(id_3)
  );
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
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_7 = id_15;
  wire id_18 = id_4;
  module_2 modCall_1 (
      id_4,
      id_17,
      id_18,
      id_2,
      id_2,
      id_14,
      id_4,
      id_11,
      id_12,
      id_18
  );
endmodule
