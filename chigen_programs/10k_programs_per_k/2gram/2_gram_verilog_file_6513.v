// Seed: 1235691296
macromodule module_0 (
    input tri1 id_0,
    output wand id_1,
    input uwire id_2,
    output tri0 id_3,
    input supply1 id_4,
    input tri id_5,
    input uwire id_6
);
  assign id_1 = id_2 == -1;
endmodule
module module_1 #(
    parameter id_17 = 32'd23
) (
    input wire id_0,
    input wire id_1,
    input supply1 id_2,
    output logic id_3,
    input tri1 id_4,
    input supply1 id_5,
    output tri1 id_6,
    output logic id_7,
    output tri id_8,
    input wand id_9,
    input supply0 id_10,
    output wand id_11,
    output wor id_12,
    input wire id_13,
    input tri id_14,
    input tri id_15
);
  wire _id_17;
  wire [id_17 : 1] id_18;
  wire id_19;
  always_ff begin : LABEL_0
    $unsigned(5);
    ;
    id_7 <= id_10;
    @(-1) begin : LABEL_1
      SystemTFIdentifier(id_10);
    end
    id_3 <= id_17;
  end
  logic id_20;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_1,
      id_11,
      id_1,
      id_10,
      id_4
  );
  assign modCall_1.id_5 = 0;
endmodule
