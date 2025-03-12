// Seed: 4186828446
module module_0 (
    input tri0 id_0,
    output wand id_1,
    input supply0 id_2,
    input supply1 id_3,
    input wor module_0,
    input wor id_5,
    input tri id_6,
    input wire id_7,
    output supply0 id_8,
    input tri0 id_9,
    input wire id_10,
    input supply1 id_11,
    input tri1 id_12,
    output tri id_13
);
  localparam id_15 = 1;
  logic [1 'b0 : 1] id_16;
  ;
  assign id_16 = 1 >= -1'b0 ? 1 : (-1);
  wire id_17;
  assign module_1.id_10 = 0;
  logic [-1 : -1 'd0] id_18;
  ;
  logic id_19 = id_6;
  localparam id_20 = 1;
  always @(posedge id_17) $clog2(28);
  ;
endmodule
module module_1 #(
    parameter id_0 = 32'd0
) (
    output wire _id_0,
    output uwire id_1,
    output wand id_2,
    input supply1 id_3,
    input tri0 id_4,
    input uwire id_5,
    output tri0 id_6,
    output uwire id_7,
    input uwire id_8,
    output supply0 id_9,
    input wire id_10
    , id_16,
    input wand id_11,
    output supply1 id_12,
    input tri1 id_13,
    input tri1 id_14
);
  wire id_17;
  module_0 modCall_1 (
      id_5,
      id_9,
      id_11,
      id_5,
      id_10,
      id_3,
      id_8,
      id_4,
      id_1,
      id_3,
      id_13,
      id_8,
      id_14,
      id_12
  );
  logic [1 : id_0] id_18 = id_3;
  always @(negedge id_8 == id_11) begin : LABEL_0
    disable id_19;
  end
endmodule
