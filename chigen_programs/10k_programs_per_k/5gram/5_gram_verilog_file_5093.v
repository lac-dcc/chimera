// Seed: 3600592803
module module_0 (
    input wire id_0,
    input supply1 id_1,
    output tri1 id_2,
    output supply1 id_3,
    input tri1 id_4,
    input tri id_5,
    input wire id_6,
    input tri id_7,
    output tri id_8,
    input supply0 id_9,
    input uwire id_10,
    input uwire id_11,
    output uwire id_12,
    output wor id_13,
    output wor id_14
);
  assign id_2 = 1'b0 / id_10 ? 1 : 1 ? (id_0) : id_0;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input  logic id_0,
    output tri1  id_1,
    input  uwire id_2,
    output logic id_3,
    input  tri1  id_4,
    output wire  id_5,
    output tri0  id_6
);
  assign id_5 = id_0 == id_4;
  always @(*) begin : LABEL_0
    #1;
    for (id_1 = 1; 1; id_6 = (1)) begin : LABEL_0
      if (id_4) begin : LABEL_0
        id_3 <= id_0;
      end
    end
  end
  module_0 modCall_1 (
      id_4,
      id_2,
      id_6,
      id_1,
      id_2,
      id_2,
      id_4,
      id_4,
      id_5,
      id_4,
      id_2,
      id_2,
      id_6,
      id_6,
      id_1
  );
  assign id_1 = 1;
endmodule
