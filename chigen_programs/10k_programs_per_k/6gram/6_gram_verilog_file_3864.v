// Seed: 492722173
module module_0 (
    output wand id_0,
    output supply1 id_1,
    output supply1 id_2,
    input wire id_3,
    output uwire id_4
);
  assign id_1 = 1;
endmodule
module module_1 (
    inout tri0 id_0,
    input wor id_1,
    output supply1 id_2,
    input tri1 id_3,
    output logic id_4,
    output uwire id_5
);
  assign id_4 = 1 - id_3;
  always @(posedge 1) begin : LABEL_0
    id_4 <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0
  );
  assign modCall_1.type_3 = 0;
endmodule
module module_2 (
    output tri1  id_0,
    inout  wand  id_1,
    output logic id_2,
    input  wand  id_3,
    output wor   id_4,
    output tri1  id_5,
    input  logic id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_1,
      id_0
  );
  assign modCall_1.type_1 = 0;
  always @(posedge id_8) begin : LABEL_0
    id_8 = id_8;
    id_2 <= id_6;
  end
endmodule
