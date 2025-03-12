// Seed: 3484803275
module module_0 (
    output tri0  id_0,
    input  wor   id_1,
    output uwire id_2
);
  assign id_0 = ~id_1;
endmodule
module module_1 (
    input  tri1  id_0,
    input  tri0  id_1,
    input  tri1  id_2,
    input  tri0  id_3,
    input  wire  id_4,
    output wor   id_5,
    output tri0  id_6,
    inout  uwire id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_7,
      id_1,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  inout supply0 id_1;
  wire [-1 : -1] id_3;
  assign id_1 = 1;
  always @(1 > id_1 or -1 & !id_2) begin : LABEL_0
    $signed(86);
    ;
  end
endmodule
module module_0 #(
    parameter id_1 = 32'd82,
    parameter id_3 = 32'd58
) (
    output logic id_0,
    input wor _id_1,
    input wor id_2,
    input supply1 _id_3
    , id_6,
    output logic id_4
);
  assign id_6[1] = -1;
  wire module_3 = id_2;
  logic [id_1 : id_3] id_7;
  assign id_0 = id_6 - id_7;
  logic id_8;
  assign id_8 = -1 == id_7;
  assign id_7 = id_8 ? id_2 : id_3 << id_8;
  generate
    for (id_9 = id_6 - 1; -1; id_0 = id_9) begin : LABEL_0
      always @(posedge id_6, -1) begin : LABEL_1
        id_4 <= 1;
      end
    end
  endgenerate
  module_2 modCall_1 (
      id_7,
      id_8
  );
  assign id_7 = id_2;
endmodule
