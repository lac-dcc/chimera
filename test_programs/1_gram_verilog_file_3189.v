// Seed: 1374223237
module module_0 (
    input wand id_0,
    id_20,
    input tri0 id_1,
    output wand id_2,
    input tri1 id_3,
    output tri id_4,
    input uwire id_5,
    input tri1 id_6,
    output wor id_7,
    input tri0 id_8,
    output logic id_9,
    input tri0 id_10,
    input uwire id_11,
    input uwire id_12,
    output tri id_13,
    input supply0 id_14,
    output wand id_15,
    input supply0 id_16,
    output uwire id_17,
    output supply1 id_18
);
  tri0 id_21;
  assign id_18 = 1;
  assign id_4  = id_8;
  assign id_17 = id_3;
  always id_9 <= 1'b0;
  localparam id_22 = -1'd0;
  assign id_21 = id_3 - id_8;
  assign module_1.type_3 = 0;
  parameter id_23 = id_22;
  wire id_24;
endmodule
module module_1 (
    output wire  id_0,
    input  tri0  id_1,
    input  logic id_2,
    output wand  id_3,
    input  uwire id_4,
    output logic id_5,
    output wor   id_6,
    output logic id_7,
    output logic id_8,
    input  wire  id_9,
    output wire  id_10,
    input  tri0  id_11,
    output wand  id_12
);
  assign {1 && -1, -1, -1, id_2} = 1;
  always begin : LABEL_0
    id_8 <= id_2;
    id_5 <= ~id_2;
    $display((id_1));
    `define pp_14 0
  end
  module_0 modCall_1 (
      id_11,
      id_11,
      id_6,
      id_4,
      id_10,
      id_9,
      id_9,
      id_12,
      id_11,
      id_8,
      id_1,
      id_1,
      id_9,
      id_6,
      id_4,
      id_12,
      id_1,
      id_6,
      id_6
  );
  wire id_15, id_16, id_17;
  always id_7 <= -1;
endmodule
