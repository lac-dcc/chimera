// Seed: 1123948821
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    input wire id_2,
    input wor id_3,
    output tri0 id_4,
    output tri id_5
    , id_21,
    input tri id_6,
    output uwire id_7,
    input wire id_8
    , id_22,
    input tri id_9,
    output supply1 id_10,
    input uwire id_11,
    input tri id_12,
    input uwire id_13,
    input wire id_14,
    input wand id_15,
    input wand id_16,
    output wor id_17,
    output uwire id_18,
    input supply0 id_19
);
  reg [-1 : 1] id_23;
  always @(posedge id_6 >= "" or posedge id_16 / -1) begin : LABEL_0
    id_23 <= (id_19);
  end
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd66,
    parameter id_6 = 32'd70
) (
    input  wire id_0,
    input  tri0 id_1,
    output wand id_2,
    input  tri  id_3,
    input  wor  _id_4
);
  logic [1 'b0 : id_4] _id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_3,
      id_2,
      id_2,
      id_1,
      id_2,
      id_3,
      id_0,
      id_2,
      id_1,
      id_1,
      id_3,
      id_0,
      id_0,
      id_3,
      id_2,
      id_2,
      id_0
  );
  logic id_7;
  logic [7:0] id_8;
  assign id_2 = id_4;
  assign id_8[(id_6)] = -1;
  wire [!  id_4 : 1 'b0] id_9;
  wire id_10;
  wire id_11;
  reg id_12;
  initial begin : LABEL_0
    id_12 = id_0;
    assert (1'b0);
  end
endmodule
