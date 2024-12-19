// Seed: 1069939764
module module_0 (
    input wor id_0,
    output supply0 id_1,
    output supply0 id_2,
    output supply0 id_3,
    input supply0 id_4,
    output wor id_5,
    input supply0 id_6,
    output tri0 id_7,
    input wire id_8
);
  wire id_10;
  assign id_1 = id_6;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input tri1 id_3,
    input tri id_4,
    input supply0 id_5
    , id_8,
    output wor id_6
);
  wire id_9;
  wire id_10;
  and primCall (id_0, id_10, id_9, id_3, id_4, id_1, id_8, id_5, id_11);
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_6,
      id_3,
      id_0,
      id_5,
      id_0,
      id_2
  );
  id_12 :
  assert property (@(posedge 1) id_12 != 1)
  else $display(1'b0 < id_8);
  id_13(
      .id_0(1), .id_1(id_12), .id_2(1'b0), .id_3(1'b0 & 1'b0), .id_4(1), .id_5(id_10), .id_6(1)
  );
  always @(posedge 1 or id_2 == id_3) $display;
  assign id_8 = 1;
endmodule
