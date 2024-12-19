// Seed: 3879254493
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    input tri id_2,
    input tri0 id_3,
    output tri0 id_4
);
  wor id_6;
  assign id_6 = 1 ? id_3 : 1'h0;
  assign module_1.type_15 = 0;
endmodule
module module_1 (
    input tri id_0,
    input wor id_1,
    input uwire id_2,
    input wand id_3,
    input tri1 id_4,
    input tri1 id_5,
    output uwire id_6,
    input tri0 id_7,
    input uwire id_8,
    output wire id_9,
    output tri0 id_10,
    input supply1 id_11,
    input wor id_12
);
  always @(posedge 1) begin : LABEL_0
    #1 id_6 = id_3;
  end
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_10
  );
endmodule
