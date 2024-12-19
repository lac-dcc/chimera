// Seed: 759200438
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input tri id_2,
    output supply1 id_3,
    output tri id_4
    , id_14,
    input supply1 id_5,
    input uwire id_6,
    output wor id_7,
    input wand id_8,
    input supply1 id_9,
    output uwire id_10
    , id_15,
    output wor id_11,
    output wire id_12
);
  wire id_16;
  initial assume (id_15[1 : 1]);
  wire id_17;
  always @(id_5) force id_4 = 1'b0;
  supply0 id_18 = id_9;
  wire id_19;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    output wand id_1,
    input supply1 id_2,
    output supply0 id_3,
    output logic id_4
);
  initial begin : LABEL_0
    while (id_2 * id_2) begin : LABEL_0
      id_1 = 1;
    end
    id_4 = #id_6 id_6;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_3,
      id_2,
      id_0,
      id_3,
      id_1,
      id_1
  );
endmodule
