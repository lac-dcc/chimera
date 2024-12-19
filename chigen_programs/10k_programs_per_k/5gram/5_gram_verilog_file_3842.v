// Seed: 3026498455
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    output wand id_2,
    output wand id_3,
    output wand id_4,
    output supply0 id_5,
    input wor id_6
);
  generate
    assign id_4 = 1;
  endgenerate
endmodule
module module_1 (
    input  logic id_0,
    input  logic id_1,
    output logic id_2,
    input  wor   id_3,
    output tri1  id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3
  );
  assign modCall_1.id_3 = 0;
  initial begin : LABEL_0
    if (1'b0)
      if ((1)) begin : LABEL_0
        case (1)
          id_3: id_2 = id_0;
          default: id_2 = id_0;
        endcase
      end
  end
  always @* begin : LABEL_0
    id_2 <= id_1;
  end
endmodule
