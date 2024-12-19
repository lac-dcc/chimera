// Seed: 3685594474
module module_0 (
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
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  always
  fork
  join_none
  wire id_7, id_8, id_9, id_10, id_11;
  wire id_12;
endmodule
module module_1 (
    output wand id_0
);
  wire id_3;
  not primCall (id_0, id_3);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2 (
    input uwire id_0,
    input wor id_1,
    output wor id_2,
    input supply1 id_3,
    input tri1 id_4,
    input wor id_5,
    input tri0 id_6,
    output uwire id_7,
    input wand id_8,
    input supply1 id_9,
    output wor id_10,
    input supply1 id_11,
    input tri0 id_12
);
  assign id_2 = 1'd0;
  id_14 :
  assert property (@(posedge id_14) id_11)
  else;
endmodule
module module_3 (
    output supply1 id_0,
    input supply0 id_1,
    input supply0 id_2,
    input tri0 id_3,
    output tri id_4,
    input supply0 id_5,
    input tri0 id_6,
    input wor id_7,
    input supply0 id_8,
    input wand id_9,
    output uwire id_10,
    input supply0 id_11,
    output tri id_12,
    output tri id_13
);
  assign id_12 = 1'b0;
  or primCall (id_4, id_9, id_2, id_1, id_11, id_3, id_7, id_5, id_6, id_8);
  module_2 modCall_1 (
      id_8,
      id_8,
      id_12,
      id_9,
      id_5,
      id_9,
      id_6,
      id_13,
      id_11,
      id_2,
      id_10,
      id_3,
      id_9
  );
  assign modCall_1.type_15 = 0;
endmodule
