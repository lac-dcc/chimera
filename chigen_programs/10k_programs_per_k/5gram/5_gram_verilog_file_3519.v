// Seed: 423951143
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    input tri1 id_2,
    output tri id_3,
    output supply0 id_4,
    input tri id_5,
    input wand id_6,
    output tri1 id_7,
    output tri0 id_8,
    input wand id_9,
    input supply0 id_10,
    output tri0 id_11,
    output supply1 id_12,
    input supply1 id_13,
    output wire id_14
    , id_17,
    output supply1 id_15
);
  wire id_18;
endmodule
module module_1 (
    input tri0 id_0,
    output wire id_1,
    output supply0 id_2,
    inout logic id_3,
    input uwire id_4,
    input wire id_5,
    input wor id_6,
    input wand id_7,
    output tri id_8
);
  always @(id_4 or posedge id_4) begin : LABEL_0
    id_3 <= id_3 & -1;
    $signed(3);
    ;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4,
      id_8,
      id_8,
      id_5,
      id_6,
      id_1,
      id_2,
      id_0,
      id_4,
      id_8,
      id_2,
      id_6,
      id_1,
      id_1
  );
  assign modCall_1.id_9 = 0;
  assign id_8 = 1;
endmodule
