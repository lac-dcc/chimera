// Seed: 4158777027
module module_0 (
    input wand id_0,
    output tri0 id_1,
    input wor id_2,
    output supply0 id_3,
    input uwire id_4,
    input wire id_5,
    input wire id_6
);
  assign id_3 = id_4;
  assign module_2.id_2 = 0;
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri1  id_1,
    input  wire  id_2,
    output tri1  id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_2,
      id_3,
      id_0,
      id_1,
      id_0
  );
endmodule
module module_2 (
    output uwire id_0,
    output logic id_1,
    input supply1 id_2,
    input tri0 id_3,
    output supply0 id_4,
    input wire id_5
    , id_22,
    input tri1 id_6,
    input tri1 id_7,
    output supply1 id_8,
    input tri1 id_9,
    input supply0 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input supply0 id_13,
    input uwire id_14,
    input tri id_15,
    input wor id_16,
    input wand id_17,
    output uwire id_18,
    output logic id_19,
    input wor id_20
);
  wire id_23;
  tri0 id_24 = 1;
  module_0 modCall_1 (
      id_2,
      id_18,
      id_13,
      id_4,
      id_16,
      id_16,
      id_14
  );
  always @(*) if (1'h0) id_1 <= 1;
  always_latch @(*) begin : LABEL_0
    id_19 <= $display;
  end
endmodule
