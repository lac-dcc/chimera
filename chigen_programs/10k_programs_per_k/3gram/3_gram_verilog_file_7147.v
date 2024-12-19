// Seed: 1590948272
module module_0 (
    input  tri1  id_0,
    output tri0  id_1,
    input  uwire id_2,
    output tri0  id_3,
    input  uwire id_4,
    input  wire  id_5
);
  assign id_3 = 1;
  wire id_7;
endmodule
module module_1 (
    input  wand  id_0,
    output wor   id_1,
    input  tri0  id_2,
    input  uwire id_3
    , id_5
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2,
      id_1,
      id_0,
      id_3
  );
  assign modCall_1.type_2 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  id_5(
      .id_0(id_4), .id_1(""), .id_2(1)
  );
endmodule
program module_3 (
    input  logic id_0,
    output logic id_1,
    input  logic id_2
);
  always @(id_0, id_0) begin : LABEL_0
    #1;
  end
  always @(posedge 1) begin : LABEL_0
    if (1) begin : LABEL_0
      id_1 <= 1;
    end
  end
  logic id_4;
  tri   id_5 = 1'b0;
  module_2 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5
  );
  wire id_6;
endprogram
