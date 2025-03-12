// Seed: 3092015444
module module_0 (
    output wor id_0,
    output wand id_1,
    input wire id_2,
    input wor id_3,
    output supply0 id_4,
    output supply1 id_5
    , id_19, id_20,
    output wand id_6,
    input wand id_7,
    output tri0 id_8,
    input tri id_9,
    input wor id_10,
    input wire id_11,
    input wor id_12,
    output wand id_13,
    output wire id_14,
    output wire id_15,
    input wand id_16,
    input tri0 id_17
);
endmodule
module module_1 #(
    parameter id_4 = 32'd58,
    parameter id_5 = 32'd12
) (
    output supply0 id_0,
    input wire id_1,
    output tri0 id_2,
    input wire id_3
    , id_9,
    input wor _id_4,
    input wor _id_5,
    output supply0 id_6,
    output supply0 id_7
);
  assign id_0 = id_5;
  wire id_10;
  always @(posedge id_5 or posedge -1) begin : LABEL_0
    wait (id_1 << -1);
  end
  module_0 modCall_1 (
      id_7,
      id_6,
      id_3,
      id_1,
      id_7,
      id_7,
      id_6,
      id_3,
      id_2,
      id_1,
      id_3,
      id_3,
      id_1,
      id_2,
      id_2,
      id_6,
      id_1,
      id_1
  );
  wire id_11;
  wire id_12;
  logic [id_4 : id_5] id_13;
endmodule
