// Seed: 1396222500
module module_0 (
    output supply0 id_0,
    input uwire id_1,
    input uwire id_2,
    output wire id_3,
    input tri0 id_4,
    input wand id_5,
    input wand id_6,
    input tri0 id_7,
    input wire id_8
);
  id_10 :
  assert property (@(id_1 ^ id_8 or {id_5{id_5}}) 1)
  else;
  wire id_11;
endmodule
module module_1 (
    output supply1 id_0,
    input wor id_1,
    input logic id_2,
    input wire id_3
);
  logic id_5;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_3,
      id_0,
      id_3,
      id_1,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.type_0 = 0;
  assign id_5 = 1 ? id_2 : id_2;
  reg id_6;
  always
    if (1) #id_7;
    else begin : LABEL_0
      fork
        id_6 <= id_5;
      join
    end
  assign id_7 = 1;
  wor id_8 = 1;
  wire id_9;
  supply1 id_10 = id_8 / 1;
endmodule
