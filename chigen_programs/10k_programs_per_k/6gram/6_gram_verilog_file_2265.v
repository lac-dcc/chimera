// Seed: 3345874911
module module_0 (
    input wor   id_0,
    input uwire id_1
);
  always @(posedge 1 or negedge 1) begin : LABEL_0
    if (id_1 == 1) id_3 <= 1;
    else id_3 <= 1;
  end
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    output tri0 id_2
);
  assign id_2 = id_0;
  buf primCall (id_2, id_0);
  module_0 modCall_1 (
      id_0,
      id_1
  );
  assign modCall_1.type_5 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1;
  assign id_2 = id_3;
  tri id_4 = 1, id_5;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_16;
  initial begin : LABEL_0
    cover ({1{id_5 - id_6}} || id_3);
    if (1) begin : LABEL_0
      id_12 <= id_10;
    end
  end
  module_2 modCall_1 (
      id_6,
      id_5,
      id_15
  );
endmodule
