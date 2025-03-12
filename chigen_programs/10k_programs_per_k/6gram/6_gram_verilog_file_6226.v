// Seed: 407932455
module module_0 (
    input wor id_0,
    input uwire id_1,
    output tri id_2,
    input wor id_3,
    input uwire id_4,
    input uwire id_5,
    input tri id_6,
    input supply1 id_7,
    output tri id_8,
    output supply0 id_9,
    output uwire id_10,
    input wand id_11,
    input supply0 id_12,
    input supply0 id_13,
    input supply1 id_14
    , id_19,
    output supply0 id_15,
    input tri0 id_16,
    output tri id_17
);
  assign id_17 = -1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input wand id_1,
    input supply1 id_2,
    output logic id_3,
    input wor id_4,
    output wand id_5,
    output wor id_6
);
  assign id_5#(
      .id_4(1),
      .id_2(-1)
  ) = id_2 ? -1'b0 : 1;
  nand primCall (id_5, id_10, id_8, id_4, id_1, id_9);
  wire id_8;
  wire id_9;
  ;
  wire id_10;
  always @(posedge id_4) begin : LABEL_0
    id_3 = 1;
  end
  module_0 modCall_1 (
      id_1,
      id_2,
      id_5,
      id_1,
      id_4,
      id_2,
      id_1,
      id_1,
      id_0,
      id_6,
      id_0,
      id_2,
      id_2,
      id_1,
      id_4,
      id_6,
      id_2,
      id_5
  );
endmodule
