// Seed: 343887020
module module_0 (
    output uwire id_0,
    input wor id_1,
    input wand id_2,
    input wand id_3,
    input wor id_4,
    input wire id_5,
    input tri0 id_6,
    input wand id_7,
    input tri id_8,
    input uwire id_9,
    output wire id_10,
    input uwire id_11,
    output tri1 id_12,
    input wand id_13,
    output supply1 id_14,
    input uwire id_15,
    output supply1 id_16,
    input wire id_17,
    input wand id_18
);
  assign id_14 = id_15;
endmodule
module module_1 (
    input wire id_0,
    input tri1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    output supply0 id_4,
    output logic id_5,
    input uwire id_6,
    input uwire id_7
);
  localparam id_9 = 1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_0,
      id_3,
      id_3,
      id_6,
      id_1,
      id_3,
      id_2,
      id_4,
      id_0,
      id_4,
      id_1,
      id_4,
      id_0,
      id_4,
      id_6,
      id_1
  );
  assign modCall_1.id_3 = 0;
  logic [7:0] id_10;
  ;
  always begin : LABEL_0
    id_10[!-1'd0] = 1;
    id_5 <= -1;
  end
endmodule
