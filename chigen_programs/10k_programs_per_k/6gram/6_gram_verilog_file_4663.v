// Seed: 2514881008
module module_0 (
    input  uwire id_0,
    output logic id_1,
    input  wire  id_2,
    input  uwire id_3,
    output logic id_4
);
  always @(posedge id_3) begin : LABEL_0
    fork
      begin : LABEL_1
        id_1 <= id_3;
      end
      id_6;
    join
    id_1 = id_3;
    force id_6 = id_0;
    if (1) begin : LABEL_2
      id_4 <= -1;
    end
  end
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    output tri1 id_2,
    output wand id_3,
    input supply0 id_4,
    output logic id_5
);
  always id_5 = #1 id_4;
  and primCall (id_2, id_1, id_4);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_0,
      id_1,
      id_5
  );
endmodule
