// Seed: 1152804328
module module_0 (
    input tri id_0,
    output wor id_1,
    output uwire id_2,
    input supply1 id_3,
    input tri0 id_4,
    output wand id_5,
    output uwire id_6,
    output supply1 id_7,
    input tri id_8,
    input supply1 id_9,
    input supply1 id_10,
    output wor id_11,
    input supply1 id_12,
    output uwire id_13,
    input tri0 id_14
);
  wire id_16;
  assign module_1.id_7 = 0;
  tri id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24, id_25 = 1;
endmodule
module module_1 (
    output wire id_0,
    input supply0 id_1,
    output uwire id_2
    , id_10,
    input logic id_3,
    output wand id_4
    , id_11,
    input logic id_5,
    output wire id_6,
    output uwire id_7,
    output supply1 id_8
);
  assign id_10 = 1 < id_5;
  always begin : LABEL_0
    assign id_10 = id_5;
    $display(id_10 & id_8++ ? 1 : id_3, 1'b0, id_5);
  end
  logic id_12;
  for (id_13 = id_12; id_5; id_11 = 1) begin : LABEL_0
    assign id_12 = 1;
  end
  module_0 modCall_1 (
      id_1,
      id_4,
      id_7,
      id_1,
      id_1,
      id_8,
      id_6,
      id_8,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_7,
      id_1
  );
  id_14(
      .id_0(1)
  );
  wire id_15;
  logic [7:0] id_16;
  assign id_4 = id_16[1];
  integer id_17;
endmodule
