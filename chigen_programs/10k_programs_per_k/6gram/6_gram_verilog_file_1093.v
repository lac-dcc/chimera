// Seed: 2741553359
module module_0 (
    input uwire id_0,
    output supply1 id_1,
    input tri id_2,
    input supply0 id_3,
    output tri1 id_4,
    input wor id_5,
    input wire id_6,
    output wire id_7,
    input uwire id_8,
    input supply1 id_9,
    output wand id_10,
    input wire id_11,
    input supply1 id_12,
    input supply1 id_13,
    input tri1 id_14
    , id_19,
    input supply1 id_15,
    input wor id_16,
    output tri1 id_17
);
  wire id_20 = id_13;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_7 = 32'd24
) (
    input supply1 id_0,
    input wand id_1,
    input uwire id_2,
    output wand id_3,
    input tri id_4,
    input supply0 id_5,
    input wor id_6,
    input wor _id_7,
    output wand id_8
);
  wire id_10;
  bit [1 : id_7] id_11;
  module_0 modCall_1 (
      id_5,
      id_8,
      id_1,
      id_1,
      id_3,
      id_4,
      id_5,
      id_3,
      id_1,
      id_1,
      id_3,
      id_0,
      id_4,
      id_1,
      id_4,
      id_2,
      id_6,
      id_3
  );
  assign {1, 1, id_0, id_6 == id_11} = $realtime;
  assign id_8 = -1 * id_6 - -1;
  logic id_12;
  assign id_3  = ~id_10;
  assign id_12 = 1;
  always @(posedge -1) begin : LABEL_0
    id_11 <= (1);
    $signed(51);
    ;
  end
endmodule
