// Seed: 1168600610
module module_0 (
    input wand  id_0,
    input tri0  id_1,
    input uwire id_2,
    input tri0  id_3
);
  localparam id_5 = 1;
  assign module_2.id_7 = 0;
endmodule
module module_1 (
    output logic id_0,
    input tri id_1,
    input supply0 id_2,
    input tri0 id_3,
    input supply0 id_4
);
  always @(*) begin : LABEL_0
    id_0 <= 1 == 1;
  end
  logic id_6;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_2,
      id_1
  );
  wire id_7[1 : 1];
  ;
endmodule
module module_2 (
    input wor id_0,
    input uwire id_1,
    input tri0 id_2,
    input wor id_3,
    output wire id_4,
    output uwire id_5,
    input uwire id_6,
    input tri id_7,
    output wor id_8,
    input wire id_9,
    output uwire id_10,
    output tri0 id_11,
    input supply1 id_12,
    output wand id_13,
    output uwire id_14,
    output wor id_15,
    input tri1 id_16
);
  localparam id_18 = 1 - 1;
  nand primCall (id_4, id_3, id_18, id_16, id_9, id_6, id_12, id_1, id_7, id_0);
  module_0 modCall_1 (
      id_7,
      id_16,
      id_6,
      id_2
  );
endmodule
