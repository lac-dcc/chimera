// Seed: 1245797259
module module_0 (
    output tri1 id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri0 id_3,
    input tri1 id_4,
    output tri id_5,
    input tri0 id_6,
    output wire id_7,
    output wire id_8,
    input wand id_9,
    input tri0 id_10,
    input supply0 id_11,
    output tri1 id_12,
    input wor id_13,
    input tri0 id_14,
    input supply1 id_15,
    input supply1 id_16,
    input tri0 id_17
);
  supply0 id_19 = 1;
  assign id_8 = ~id_3;
  for (id_20 = id_6; id_10; id_5 = id_14) begin : LABEL_0
    assign id_5 = 1'b0;
  end
  assign id_8 = id_9;
  assign module_1.id_3 = 0;
  supply1 id_21;
  assign id_12 = {id_6, id_21, 1, id_13};
  always_ff id_20 = (id_9);
endmodule
module module_1 (
    input uwire id_0,
    input tri id_1,
    input wor id_2,
    output tri1 id_3,
    input supply1 id_4,
    output uwire id_5,
    input wor id_6
);
  assign id_3 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_2,
      id_6,
      id_3,
      id_1,
      id_5,
      id_5,
      id_4,
      id_0,
      id_2,
      id_3,
      id_0,
      id_1,
      id_6,
      id_1,
      id_6
  );
  tri0 id_8 = 1;
endmodule
