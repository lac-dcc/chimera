// Seed: 1591404358
module module_0 (
    input wor id_0,
    input wor id_1,
    output supply0 id_2,
    output wor id_3,
    output wor id_4,
    input supply0 id_5,
    output tri1 id_6,
    input supply1 id_7,
    input wire id_8,
    input tri0 id_9,
    input wand id_10
);
  assign module_1.id_7 = 0;
  always_comb @(posedge 1) begin : LABEL_0
    #1 begin : LABEL_0
      id_2 = 1;
    end
  end
  wire id_12;
endmodule
module module_1 (
    input uwire id_0,
    output supply1 id_1,
    input tri1 id_2,
    inout supply1 id_3,
    input tri1 id_4,
    input wor id_5,
    input tri id_6,
    input tri1 id_7,
    input tri1 id_8,
    input tri1 id_9,
    input tri id_10
);
  wire id_12;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_3,
      id_1,
      id_1,
      id_5,
      id_3,
      id_7,
      id_6,
      id_0,
      id_0
  );
endmodule
