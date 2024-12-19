// Seed: 1111183943
module module_0 (
    input  wor  id_0,
    input  tri1 id_1,
    output tri0 id_2,
    input  tri  id_3,
    input  tri0 id_4,
    input  tri  id_5,
    input  wire id_6
);
  assign id_2 = id_1;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    input supply0 id_2,
    inout wand id_3,
    output tri0 id_4,
    input tri1 id_5,
    input wire id_6,
    input tri0 id_7,
    output wand id_8,
    input wire id_9
    , id_15,
    input tri id_10,
    output supply0 id_11,
    output wor id_12,
    input wand id_13
);
  tri0 id_16, id_17;
  supply1 id_18 = 1'b0;
  id_19 :
  assert property (@(negedge {1}) id_6)
  else;
  assign id_4 = id_5;
  always begin : LABEL_0
    id_17 = 1;
  end
  or primCall (
      id_4,
      id_18,
      id_7,
      id_10,
      id_6,
      id_19,
      id_0,
      id_13,
      id_2,
      id_17,
      id_15,
      id_5,
      id_3,
      id_9,
      id_16
  );
  module_0 modCall_1 (
      id_0,
      id_10,
      id_12,
      id_5,
      id_0,
      id_3,
      id_7
  );
  assign modCall_1.type_5 = 0;
endmodule
