// Seed: 1575327018
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    input supply0 id_2,
    output supply1 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input tri id_6,
    input supply0 id_7,
    input uwire id_8,
    input supply1 id_9,
    output supply1 id_10,
    output supply1 id_11
    , id_18,
    output tri1 id_12,
    output tri id_13,
    input uwire id_14,
    input supply1 id_15,
    input supply1 id_16
);
  assign id_11 = id_5;
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_9 = 32'd86
) (
    output wor id_0,
    output logic id_1,
    input tri1 id_2,
    input wand id_3,
    input tri1 id_4,
    output tri id_5,
    input tri id_6,
    input wire id_7,
    input tri1 id_8,
    input supply0 _id_9,
    input wand id_10
);
  wire id_12;
  initial begin : LABEL_0
    if (1) begin : LABEL_1
      id_1 <= -1'b0;
    end
  end
  wire id_13;
  module_0 modCall_1 (
      id_10,
      id_0,
      id_7,
      id_5,
      id_8,
      id_4,
      id_4,
      id_6,
      id_4,
      id_7,
      id_0,
      id_5,
      id_5,
      id_0,
      id_10,
      id_4,
      id_4
  );
  wire id_14;
  wire id_15;
  wire [-1 : id_9] id_16;
endmodule
