// Seed: 3780971564
module module_0 (
    output tri0 id_0,
    output tri id_1,
    input wor id_2,
    output wire id_3,
    output tri0 id_4,
    input supply1 id_5,
    input wand id_6,
    output uwire id_7,
    input tri id_8,
    output supply1 id_9,
    output tri id_10
);
  wire id_12;
endmodule
module module_1 (
    output uwire id_0,
    output tri0 id_1,
    input wand id_2,
    output uwire id_3,
    input supply1 id_4,
    input wand id_5,
    output uwire id_6,
    input wand id_7,
    output wire id_8
);
  tri id_10;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_8,
      id_8,
      id_5,
      id_2,
      id_1,
      id_7,
      id_1,
      id_1
  );
  assign modCall_1.id_5 = 0;
  always @(posedge 1 or id_10) begin : LABEL_0
    wait (id_10);
  end
endmodule
