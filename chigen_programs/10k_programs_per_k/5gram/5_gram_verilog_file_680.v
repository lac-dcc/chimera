// Seed: 3861491990
module module_0 (
    output logic id_0,
    input wand id_1,
    input uwire id_2,
    input supply1 id_3
);
  always @(posedge id_2) id_0 = -1'b0;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd52
) (
    output uwire id_0,
    input wire _id_1,
    output wand id_2,
    input uwire id_3,
    input tri0 id_4,
    input wor id_5,
    output tri id_6,
    input supply0 id_7,
    output logic id_8,
    output wire id_9
    , id_18,
    input uwire id_10,
    output supply1 id_11,
    input supply1 id_12,
    output tri0 id_13,
    output wand id_14,
    input wor id_15,
    input supply0 id_16
);
  wire id_19;
  wire [id_1 : 1] id_20;
  always @(id_18 == -1 or posedge id_16 ^ id_12) if (1) id_8 <= id_4;
  module_0 modCall_1 (
      id_8,
      id_3,
      id_10,
      id_5
  );
  wire id_21;
  localparam id_22 = -1'b0;
  logic id_23;
endmodule
