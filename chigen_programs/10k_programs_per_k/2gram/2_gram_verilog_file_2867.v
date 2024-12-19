// Seed: 2850481766
module module_0 (
    input wor id_0,
    input wor id_1,
    output supply0 id_2,
    output tri1 id_3,
    output supply1 id_4,
    output tri0 id_5,
    input supply0 id_6,
    input tri id_7,
    output supply0 id_8,
    input wor id_9,
    input wor id_10,
    input wire id_11,
    input tri0 id_12,
    output wand id_13,
    input wor id_14
);
  assign id_5 = 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output tri0 id_1,
    output wire id_2,
    inout uwire id_3,
    output uwire id_4,
    input wor id_5,
    output tri0 id_6,
    input supply0 id_7,
    output supply0 id_8,
    output supply0 id_9,
    output wor id_10,
    input tri id_11
);
  wire id_13;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_3,
      id_2,
      id_9,
      id_7,
      id_7,
      id_10,
      id_5,
      id_5,
      id_5,
      id_3,
      id_8,
      id_5
  );
  wire id_14;
  id_15 :
  assert property (@(posedge 1) 1'd0)
  else;
  id_16(
      .id_0((1)), .id_1(id_8), .id_2(id_7), .id_3(id_11 ^ 1), .id_4(1 - 1)
  );
  assign id_6 = id_5;
  assign id_2 = 1'b0;
  xnor primCall (id_8, id_5, id_13, id_3, id_11, id_7);
  assign id_6 = id_11 - id_7;
endmodule
