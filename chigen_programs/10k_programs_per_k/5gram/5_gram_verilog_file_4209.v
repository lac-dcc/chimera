// Seed: 1675251695
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    input tri1 id_2,
    input supply0 id_3,
    input tri1 id_4,
    output uwire id_5,
    input wire id_6
    , id_18,
    output wor id_7,
    input tri0 id_8,
    input tri id_9,
    input wire id_10,
    input wand id_11,
    output wire id_12,
    output wor id_13,
    output tri id_14,
    input wire id_15,
    output supply0 id_16
);
  reg id_19;
  always @(id_19 or negedge -1) begin : LABEL_0
    id_19 = -1'd0;
  end
  parameter id_20 = 1;
  wire id_21;
  ;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd63
) (
    output wand id_0,
    input supply0 id_1,
    input supply1 _id_2,
    output supply0 id_3,
    output wand id_4,
    input wor id_5,
    output wand id_6,
    output wor id_7,
    output wire id_8,
    output wand id_9,
    input wire id_10
    , id_14,
    output wire id_11,
    output tri0 id_12
);
  wire id_15 = id_1;
  logic [id_2 : -1 'b0] id_16;
  ;
  module_0 modCall_1 (
      id_8,
      id_1,
      id_1,
      id_5,
      id_1,
      id_4,
      id_5,
      id_4,
      id_1,
      id_5,
      id_1,
      id_10,
      id_7,
      id_12,
      id_8,
      id_1,
      id_4
  );
endmodule
