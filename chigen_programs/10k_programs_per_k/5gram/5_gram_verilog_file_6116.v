// Seed: 2381310678
module module_0 (
    input wand id_0,
    input uwire id_1,
    input tri1 id_2,
    output wand id_3,
    output wor id_4,
    input tri1 id_5,
    output supply1 id_6,
    input supply0 id_7,
    input tri1 id_8,
    output wire id_9,
    output tri1 id_10,
    input supply1 id_11,
    inout tri id_12,
    input wor id_13
);
  wire id_15;
endmodule
module module_1 (
    output uwire id_0,
    output wire id_1,
    input uwire id_2,
    output logic id_3,
    input supply0 id_4,
    input wire id_5,
    input tri0 id_6,
    input wand id_7,
    output tri0 id_8,
    input wor id_9
    , id_11
);
  wand id_12 = id_7;
  always @(posedge 1'b0 or posedge id_12)
    if (1 == 1) begin : LABEL_0
      assign id_3 = 1'd0 == id_12;
    end else id_3 <= 1;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_9,
      id_8,
      id_1,
      id_5,
      id_12,
      id_7,
      id_12,
      id_0,
      id_0,
      id_6,
      id_12,
      id_7
  );
  assign modCall_1.id_3 = 0;
  uwire id_13 = id_5;
endmodule
