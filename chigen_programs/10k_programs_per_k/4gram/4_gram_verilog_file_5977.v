// Seed: 4145567971
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_1
  );
endmodule
module module_2 (
    input  tri0  id_0,
    input  tri   id_1,
    input  uwire id_2,
    input  tri1  id_3,
    input  tri   id_4,
    input  uwire id_5,
    output uwire id_6,
    input  tri   id_7,
    input  uwire id_8
);
endmodule
module module_3 (
    input uwire id_0,
    output supply1 id_1,
    input wand id_2,
    output tri1 id_3,
    input tri1 id_4,
    input supply0 id_5
    , id_14,
    input uwire id_6,
    input uwire id_7,
    output tri id_8,
    input logic id_9,
    output logic id_10,
    output wand id_11,
    input supply1 id_12
);
  always @(1) begin : LABEL_0
    id_10 <= 1'b0;
    fork
      id_14 <= #1 1 - id_12;
      id_14 <= id_9;
    join
  end
  module_2 modCall_1 (
      id_6,
      id_4,
      id_6,
      id_7,
      id_5,
      id_2,
      id_11,
      id_5,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
