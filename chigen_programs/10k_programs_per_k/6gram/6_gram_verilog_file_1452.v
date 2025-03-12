// Seed: 3749703783
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    input supply0 id_2,
    output uwire id_3,
    output tri id_4,
    input tri id_5,
    inout supply0 id_6,
    input wor id_7,
    input supply1 id_8,
    input uwire id_9,
    output wor id_10
    , id_24, id_25,
    output supply1 id_11,
    input tri id_12,
    output wor id_13,
    input supply1 id_14,
    output tri id_15,
    input supply1 id_16,
    output tri0 id_17,
    input wand id_18
    , id_26,
    input tri id_19,
    output tri1 id_20,
    input uwire id_21,
    input wire id_22
);
  always @(posedge 1) begin : LABEL_0
    $signed(24);
    ;
    fork
      repeat (-1) @(id_7 * -1 + -1);
    join
  end
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output wire id_0,
    inout supply0 id_1,
    output wor id_2
);
  wor id_4;
  parameter id_5 = -1;
  assign id_1 = -1;
  assign id_4 = -1'b0;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
