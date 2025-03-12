// Seed: 3960664274
module module_0 (
    input supply0 id_0,
    output supply0 id_1,
    input wor id_2,
    output tri0 id_3,
    input uwire id_4,
    output wire id_5,
    output uwire id_6,
    input uwire id_7,
    input tri0 id_8,
    input tri id_9,
    input supply1 id_10,
    output tri0 id_11,
    input uwire id_12,
    input wor id_13,
    output wor id_14,
    output supply1 id_15,
    output tri1 id_16,
    output wire module_0,
    input supply0 id_18
);
  parameter id_20 = 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input wor id_1,
    output tri0 id_2,
    input supply0 id_3,
    input wor id_4,
    input supply1 id_5,
    input uwire id_6,
    input wire id_7,
    input tri id_8
);
  always @(1 or 1) begin : LABEL_0
    $signed(64);
    ;
  end
  xor primCall (id_0, id_7, id_3, id_6);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_0,
      id_5,
      id_0,
      id_0,
      id_1,
      id_3,
      id_4,
      id_8,
      id_0,
      id_5,
      id_1,
      id_2,
      id_0,
      id_2,
      id_0,
      id_8
  );
endmodule
