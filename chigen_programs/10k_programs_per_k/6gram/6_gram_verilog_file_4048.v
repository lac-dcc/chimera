// Seed: 27540914
module module_0 (
    output uwire id_0,
    output wire id_1,
    input supply0 id_2,
    output supply1 id_3,
    input wand id_4,
    output tri0 id_5,
    input supply0 id_6,
    output wand id_7,
    input tri1 id_8,
    output tri id_9,
    input wand id_10,
    output wire id_11,
    input wire id_12,
    input wire id_13,
    input tri id_14,
    output wire id_15
);
  wire id_17;
  assign id_5 = id_10;
endmodule
module module_1 #(
    parameter id_11 = 32'd38,
    parameter id_7  = 32'd71
) (
    input tri1 id_0,
    input wor id_1,
    input tri id_2,
    input tri1 id_3,
    output tri0 id_4,
    input wor id_5,
    input tri0 id_6,
    input uwire _id_7,
    input tri1 id_8,
    input wand id_9
    , id_15,
    output logic id_10,
    input supply1 _id_11,
    input tri1 id_12,
    output uwire id_13
);
  wire [id_7 : id_11] id_16;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_5,
      id_13,
      id_9,
      id_4,
      id_5,
      id_4,
      id_3,
      id_4,
      id_0,
      id_13,
      id_3,
      id_2,
      id_12,
      id_13
  );
  assign modCall_1.id_2 = 0;
  always @(posedge id_2, negedge id_3) begin : LABEL_0
    id_10 <= id_0;
  end
endmodule
