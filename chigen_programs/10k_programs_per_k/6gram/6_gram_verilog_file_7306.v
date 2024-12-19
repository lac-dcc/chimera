// Seed: 3819559510
module module_0 (
    output uwire id_0,
    input wor id_1,
    input uwire id_2,
    input wor id_3,
    input uwire id_4,
    input tri id_5,
    input uwire id_6,
    input uwire id_7,
    input supply0 id_8,
    output tri id_9,
    input tri id_10,
    input supply1 id_11,
    output wire id_12,
    output wire id_13,
    output tri1 id_14,
    input supply1 id_15
    , id_19,
    input wand id_16,
    output wire id_17
);
  wor id_20 = 1 - 1'b0;
  assign id_13 = id_16;
  assign module_1.id_6 = 0;
  id_21(
      .id_0(1 == 1), .id_1(""), .id_2(id_13 - 1'd0), .id_3()
  );
endmodule
module module_1 (
    input tri1 id_0,
    output wor id_1,
    input tri id_2,
    output supply1 id_3,
    input supply0 id_4,
    output logic id_5,
    input supply1 id_6,
    input tri id_7,
    input wand id_8,
    output supply1 id_9
);
  always @(1 < id_2) begin : LABEL_0
    id_5 <= 1 - id_6;
    if (1) begin : LABEL_0
      #1 id_9 = 1'b0;
    end
  end
  module_0 modCall_1 (
      id_1,
      id_6,
      id_8,
      id_7,
      id_6,
      id_6,
      id_7,
      id_2,
      id_2,
      id_1,
      id_8,
      id_0,
      id_3,
      id_1,
      id_9,
      id_4,
      id_8,
      id_3
  );
endmodule
