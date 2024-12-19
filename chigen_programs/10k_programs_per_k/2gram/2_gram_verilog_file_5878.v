// Seed: 1586604459
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    output uwire id_2
);
  wire id_4;
  wire id_5;
  wire id_6;
  assign id_4 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    input wire id_2,
    input wire id_3,
    output tri1 id_4,
    input supply1 id_5,
    input tri1 id_6,
    output tri id_7,
    output tri id_8,
    input supply0 id_9,
    output uwire id_10,
    output uwire id_11,
    input uwire id_12,
    output wor id_13,
    output wor id_14
);
  module_0 modCall_1 (
      id_8,
      id_6,
      id_4
  );
  uwire id_16 = 1'd0;
  id_17 :
  assert property (@((id_16), posedge 1 or posedge id_0) 1 - 1)
  else;
endmodule
