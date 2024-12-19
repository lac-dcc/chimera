// Seed: 3152210737
module module_0 (
    input wire id_0,
    input tri id_1,
    input supply1 id_2,
    input wand id_3,
    input tri0 id_4,
    input uwire id_5,
    input uwire id_6,
    output supply1 id_7,
    input tri id_8,
    output tri id_9,
    output uwire id_10
);
  assign id_9 = id_5;
  wire id_12, id_13;
  supply1 id_14 = id_3 - 1;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    input tri id_2,
    input wor id_3,
    input tri id_4,
    input tri1 id_5,
    input tri1 id_6,
    input uwire id_7,
    output supply1 id_8,
    input wor id_9,
    input tri1 id_10,
    input uwire id_11
);
  always @(posedge 1 == 1)
    if (id_7) begin : LABEL_0
      deassign id_8;
    end
  tri id_13 = id_3;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_1,
      id_5,
      id_11,
      id_13,
      id_7,
      id_13,
      id_10,
      id_8,
      id_8
  );
  assign modCall_1.id_2 = 0;
  assign id_13 = id_6;
  and primCall (id_8, id_7, id_0, id_9, id_13);
endmodule
