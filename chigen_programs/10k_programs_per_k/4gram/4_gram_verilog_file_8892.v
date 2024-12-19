// Seed: 512495934
module module_0 (
    output wand  id_0,
    output tri   id_1,
    input  tri1  id_2,
    input  uwire id_3
);
  assign module_1.id_0 = 0;
  always @(id_2) begin : LABEL_0
    id_0 = 1;
  end
  module_2 modCall_1 (
      id_2,
      id_2
  );
  assign modCall_1.type_8 = 0;
endmodule
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    output logic id_2,
    input supply1 id_3,
    input tri id_4,
    input logic module_1,
    output wand id_6
);
  initial begin : LABEL_0
    id_2 <= id_5;
  end
  module_0 modCall_1 (
      id_1,
      id_6,
      id_0,
      id_3
  );
endmodule
module module_2 (
    input tri  id_0,
    input wand id_1
);
  if (id_1) begin : LABEL_0
    initial begin : LABEL_0
      assert (1);
    end
    wire id_3;
  end else begin : LABEL_0
    assign id_4[1'h0] = id_0;
  end
  supply0 id_5;
  supply1 id_6 = 1'b0 + id_5++;
endmodule
