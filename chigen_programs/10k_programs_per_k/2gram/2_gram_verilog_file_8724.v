// Seed: 3920432003
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 (
    output logic   id_0,
    input  supply1 id_1
    , id_3
);
  always id_0 <= -1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2 (
    output tri0 id_0,
    input wand id_1,
    input uwire id_2,
    output tri id_3,
    output tri0 id_4,
    input wor id_5,
    input uwire id_6,
    input tri id_7,
    output wand id_8,
    input supply0 id_9,
    input wire id_10,
    input tri1 id_11,
    output wand id_12,
    input supply1 id_13,
    input wire id_14,
    input tri1 id_15,
    input supply0 id_16,
    output tri id_17
);
  if (1) begin : LABEL_0
    assign id_3 = id_16;
  end
  assign module_3.id_1 = 0;
endmodule
module module_3 (
    output uwire id_0,
    input  tri0  id_1,
    output wire  id_2
);
  logic id_4;
  nand primCall (id_2, id_4, id_1);
  module_2 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2
  );
  always id_4 <= #1 id_4;
endmodule
