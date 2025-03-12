// Seed: 1777150625
module module_0 (
    output wand id_0,
    input tri1 id_1,
    input supply0 id_2,
    output uwire id_3
    , id_9,
    input tri0 id_4,
    input wor id_5,
    output supply1 id_6,
    input wire id_7
);
endmodule
module module_1 #(
    parameter id_4 = 32'd40
) (
    input wor id_0,
    output wor id_1,
    output logic id_2,
    input supply0 id_3,
    input wor _id_4,
    output wor id_5,
    input wire id_6,
    output supply0 id_7,
    input tri1 id_8,
    output supply1 id_9,
    output tri0 id_10,
    input supply0 id_11,
    inout tri id_12,
    input tri1 id_13,
    inout tri1 id_14,
    output supply1 id_15,
    input tri0 id_16,
    output wand id_17
);
  wire [$realtime : id_4] id_19;
  module_0 modCall_1 (
      id_15,
      id_16,
      id_6,
      id_14,
      id_13,
      id_13,
      id_17,
      id_13
  );
  always @(posedge id_14 or posedge -1) begin : LABEL_0
    id_2 <= id_13 - -1;
  end
endmodule
