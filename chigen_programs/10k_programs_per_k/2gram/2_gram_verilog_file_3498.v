// Seed: 3353927103
module module_0 (
    input tri0 id_0,
    input wire id_1,
    output uwire id_2,
    input wand id_3,
    input tri0 id_4,
    output uwire id_5,
    output supply1 id_6,
    output tri id_7,
    output tri0 id_8,
    output wand id_9,
    input uwire id_10,
    input supply1 id_11,
    input tri1 id_12,
    input wor id_13
);
  always_comb begin : LABEL_0$display
    ;
    $display(id_3, 1'b0);
  end
  assign module_1.type_10 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output wor id_1,
    output tri id_2,
    output tri0 id_3,
    output uwire id_4
);
  wor  id_6;
  wire id_7;
  id_8(
      .id_0(id_1), .id_1(id_1)
  );
  wire id_9;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_0,
      id_6,
      id_3,
      id_6,
      id_1,
      id_3,
      id_2,
      id_6,
      id_0,
      id_6,
      id_0
  );
endmodule
