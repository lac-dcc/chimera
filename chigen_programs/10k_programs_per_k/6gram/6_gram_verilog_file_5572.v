// Seed: 4153333103
module module_0 (
    output uwire id_0
    , id_19,
    input tri1 id_1,
    output uwire id_2,
    output tri id_3,
    input wand id_4,
    output wire id_5,
    input uwire id_6,
    output uwire id_7,
    output wor id_8
    , id_20, id_21,
    input tri0 id_9,
    input uwire id_10,
    input uwire id_11,
    input wire id_12,
    input wand id_13,
    output supply1 id_14,
    output supply1 id_15,
    output wand id_16,
    output logic id_17
);
  initial id_17 = id_11 && id_21;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    inout logic id_1,
    input tri0 id_2,
    input wor id_3,
    output logic id_4,
    input wire id_5,
    inout tri0 id_6,
    input tri0 id_7,
    output uwire id_8,
    output supply1 id_9,
    input tri id_10,
    output logic id_11,
    input tri0 id_12,
    input tri id_13,
    input wor id_14,
    input tri0 id_15,
    output logic id_16
);
  initial begin : LABEL_0
    if (1) begin : LABEL_1
      id_4 <= id_14;
    end
    if (1 & (1)) id_11 <= id_12;
    else
      #1 begin : LABEL_2
        id_16 <= 1;
        id_1 = -1;
      end
  end
  module_0 modCall_1 (
      id_6,
      id_5,
      id_6,
      id_8,
      id_15,
      id_9,
      id_13,
      id_9,
      id_8,
      id_7,
      id_7,
      id_14,
      id_10,
      id_0,
      id_8,
      id_8,
      id_8,
      id_16
  );
  logic id_18 = -1'h0;
endmodule
