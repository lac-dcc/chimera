// Seed: 255592657
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    output tri id_2,
    input tri id_3,
    output supply1 id_4,
    input wire id_5,
    output wire id_6,
    input tri1 id_7,
    output uwire id_8,
    output uwire id_9,
    output wor id_10,
    input wor id_11,
    output uwire id_12,
    output uwire id_13,
    input tri id_14
);
  assign id_2 = 1;
endmodule
module module_1 (
    input uwire id_0,
    input wire id_1,
    input supply1 id_2,
    output tri0 id_3,
    inout supply1 id_4,
    output wor id_5,
    output supply1 id_6,
    output supply1 id_7
    , id_10,
    output supply0 id_8
);
  wire id_11;
  assign id_6 = (1);
  wire id_12;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_7,
      id_4,
      id_5,
      id_4,
      id_4,
      id_2,
      id_5,
      id_7,
      id_8,
      id_1,
      id_4,
      id_6,
      id_2
  );
  assign modCall_1.id_10 = 0;
  id_13 :
  assert property (@(posedge id_4) 1)
  else $display;
endmodule
