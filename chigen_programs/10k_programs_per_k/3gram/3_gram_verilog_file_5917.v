// Seed: 2873723343
module module_0 (
    output wor id_0,
    output tri1 id_1,
    input tri0 id_2,
    input wor id_3,
    input wire id_4
    , id_12,
    input tri0 id_5,
    input tri id_6,
    input wand id_7,
    output supply1 id_8,
    input wand id_9,
    output tri1 id_10
);
  tri id_13 = 1'd0;
endmodule
module module_1 (
    output wand id_0,
    output tri1 id_1,
    input supply1 id_2
    , id_6,
    input tri1 id_3,
    output wor id_4
);
  id_7 :
  assert property (@((id_6) << 1'h0 & 1) id_3)
  else begin : LABEL_0
    $clog2(56);
    ;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_3,
      id_0,
      id_2,
      id_0
  );
  assign modCall_1.id_10 = 0;
  wire  id_8;
  logic id_9;
  parameter id_10 = 1;
endmodule
