// Seed: 482693583
module module_0 (
    input wor id_0,
    output wor id_1,
    output uwire id_2,
    input wand id_3,
    input supply1 id_4,
    output wor id_5
    , id_18,
    output supply1 id_6,
    input tri0 id_7,
    input supply1 id_8,
    input tri1 id_9,
    output wor id_10,
    output tri0 id_11,
    input uwire id_12,
    input tri id_13,
    input wor id_14,
    input wor id_15,
    output uwire id_16
);
  wire id_19;
  ;
  always @(posedge id_0) begin : LABEL_0
    if (1 || ~{1'b0, (1), -1, 1} || -1) begin : LABEL_1
      deassign id_11.id_8;
    end
  end
endmodule
module module_1 (
    input  tri1 id_0,
    input  wor  id_1,
    output tri  id_2,
    output tri  id_3
);
  assign id_3 = 1'b0;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_3,
      id_1,
      id_1,
      id_3,
      id_2,
      id_1,
      id_1,
      id_0,
      id_3,
      id_3,
      id_1,
      id_1,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.id_12 = 0;
endmodule
