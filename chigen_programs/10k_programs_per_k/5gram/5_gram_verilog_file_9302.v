// Seed: 3129399942
module module_0 (
    input tri id_0,
    output supply1 id_1,
    output wire id_2
);
  wire id_4;
endmodule
module module_1 #(
    parameter id_3 = 32'd60
) (
    output tri1 id_0,
    output supply0 id_1,
    output supply0 id_2
    , id_12,
    input wor _id_3,
    output logic id_4,
    output tri1 id_5,
    input wand id_6,
    output tri0 id_7,
    input wand id_8,
    input wand id_9,
    input wire id_10
);
  always @(posedge id_12 or 1) begin : LABEL_0
    id_4 <= 1'b0;
  end
  assign id_4 = ~id_12[id_3];
  module_0 modCall_1 (
      id_9,
      id_7,
      id_1
  );
  assign modCall_1.id_1 = 0;
  wor id_13 = -1 ? -1 | 1 << 1 : 1;
endmodule
