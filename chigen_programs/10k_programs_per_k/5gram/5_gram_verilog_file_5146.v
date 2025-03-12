// Seed: 577643166
module module_0 (
    output tri1  id_0,
    output wand  id_1,
    input  wand  id_2,
    output uwire id_3,
    input  tri1  id_4,
    output wire  id_5
);
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output wire id_1,
    input wor id_2,
    input tri1 id_3,
    output tri0 id_4,
    input uwire id_5,
    output logic id_6,
    input wand id_7,
    output supply1 id_8,
    output logic id_9,
    inout logic id_10
);
  always @(id_7, posedge -1) begin : LABEL_0
    if ((1)) begin : LABEL_1
      if (1) id_9 <= 1 - -1;
      else begin : LABEL_2
        id_10 = -1;
      end
    end
  end
  always @(negedge id_10 !=? id_5 or negedge id_10) begin : LABEL_3
    if (1) begin : LABEL_4
      id_9 <= -1;
      id_6 <= id_5;
    end
  end
  module_0 modCall_1 (
      id_0,
      id_8,
      id_7,
      id_8,
      id_7,
      id_1
  );
endmodule
