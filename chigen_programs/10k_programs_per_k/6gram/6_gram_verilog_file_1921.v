// Seed: 376469573
module module_0 (
    input wor id_0,
    output tri id_1,
    output uwire id_2,
    output wor id_3,
    output uwire id_4,
    input wire id_5,
    input tri id_6,
    output tri id_7,
    input tri0 id_8,
    input wor id_9,
    input tri1 id_10,
    input supply1 id_11,
    input uwire id_12,
    output wor id_13,
    output wor id_14,
    input wand id_15
);
  assign id_13 = 1;
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd79,
    parameter id_6 = 32'd88,
    parameter id_9 = 32'd64
) (
    input supply0 id_0,
    input wor id_1,
    input wand id_2,
    input supply1 _id_3,
    input uwire id_4,
    input supply0 id_5,
    input tri _id_6,
    input supply1 id_7,
    output tri id_8,
    input supply1 _id_9
    , id_11
);
  logic [id_6 : -1  /  id_3] id_12 = -1;
  module_0 modCall_1 (
      id_0,
      id_8,
      id_8,
      id_8,
      id_8,
      id_4,
      id_5,
      id_8,
      id_0,
      id_0,
      id_2,
      id_0,
      id_4,
      id_8,
      id_8,
      id_0
  );
  always @(posedge {1,
    id_7
  })
  begin : LABEL_0
    id_11[id_3] <= id_11;
    deassign id_11;
  end
  logic [id_9 : -1] id_13 = 1;
endmodule
