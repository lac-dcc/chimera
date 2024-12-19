// Seed: 1088678106
module module_0 (
    output wand id_0,
    input wand id_1,
    input supply0 id_2,
    input tri1 id_3,
    input wor id_4,
    output supply0 id_5,
    input supply1 id_6
);
  always @(posedge 1) id_0 = id_1 | 1'd0;
  assign module_1.type_0 = 0;
  initial begin : LABEL_0
    id_0 = id_2 == (id_6 == id_6);
    if (id_2) begin : LABEL_0
      id_0 = 1;
    end
  end
endmodule
module module_1 (
    input  uwire id_0,
    output uwire id_1
);
  wire id_3;
  not primCall (id_1, id_0);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0
  );
endmodule
