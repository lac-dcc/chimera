// Seed: 932751704
module module_0 (
    input  tri1 id_0,
    output wand id_1,
    input  wand id_2
);
  assign id_1 = id_2;
  assign id_1 = 1;
  wire id_4;
  wire id_5;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    input tri0 id_2,
    input wor id_3,
    input tri0 id_4,
    input wire id_5,
    output wire id_6,
    input logic id_7,
    output logic id_8,
    input supply1 id_9,
    output wand id_10,
    output logic id_11,
    input wor id_12,
    input wor id_13,
    input uwire id_14,
    input supply1 id_15,
    input logic id_16,
    input logic id_17,
    output logic id_18
);
  always #1 begin : LABEL_0
    if (1 << 1 - 1) begin : LABEL_0
      id_11 = id_17;
    end else begin : LABEL_0
      id_18 <= #1 1;
      id_8  <= (1);
      id_10 = 1;
      id_11 <= id_16;
      id_18 <= id_7;
      id_8  <= 1;
    end
    id_18 <= id_7;
  end
  module_0 modCall_1 (
      id_4,
      id_10,
      id_12
  );
  assign modCall_1.type_7 = 0;
endmodule
