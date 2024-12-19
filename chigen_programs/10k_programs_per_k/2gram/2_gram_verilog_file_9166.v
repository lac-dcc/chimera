// Seed: 680647237
module module_0 (
    output supply0 id_0,
    output uwire id_1,
    input wor id_2,
    input uwire id_3,
    output wor id_4
    , id_19,
    output uwire id_5,
    output logic id_6,
    output wand id_7,
    input logic id_8,
    output tri id_9,
    output logic id_10,
    output supply0 id_11,
    output supply0 id_12
    , id_20,
    input supply1 id_13,
    input tri id_14,
    output supply0 id_15,
    input uwire id_16,
    output tri id_17
);
  logic [7:0] id_21;
  initial id_6 <= 1;
  always begin : LABEL_0
    id_10 <= id_8;
  end
  supply1 id_22;
  wire id_23;
  assign module_1.id_2 = 0;
  wire id_24;
  always begin : LABEL_0
    id_9 = id_20;
  end
  wire id_25;
  assign id_21[1] = 1 >= id_22;
  wire id_26;
endmodule
module module_1 (
    input  logic id_0,
    output uwire id_1,
    output logic id_2,
    input  wire  id_3,
    input  wand  id_4
);
  always_latch begin : LABEL_0
    id_2 <= id_0;
  end
  always id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_4,
      id_3,
      id_1,
      id_1,
      id_2,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_1
  );
endmodule
