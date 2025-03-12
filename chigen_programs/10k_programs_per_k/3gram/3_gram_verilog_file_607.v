// Seed: 2022256097
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    output supply0 id_2,
    input wire id_3,
    input tri1 id_4,
    output wire id_5,
    input wand id_6,
    input tri1 id_7,
    output tri1 id_8
    , id_12,
    output uwire id_9
    , id_13,
    output wire id_10
);
  wire id_14;
endmodule
module module_1 #(
    parameter id_10 = 32'd36
) (
    input uwire id_0,
    input wor id_1,
    input wor id_2,
    input uwire id_3,
    output logic id_4,
    input uwire id_5,
    output uwire id_6,
    input uwire id_7,
    input supply0 id_8,
    output tri id_9,
    input tri _id_10,
    input supply1 id_11,
    input wire id_12,
    output logic id_13,
    input wire id_14,
    input tri1 id_15
);
  xor primCall (id_13, id_3, id_17, id_15, id_2, id_8, id_0, id_5, id_1, id_11, id_7, id_12, id_14);
  logic [-1 : -1  ==  id_10] id_17;
  module_0 modCall_1 (
      id_15,
      id_9,
      id_6,
      id_5,
      id_1,
      id_6,
      id_12,
      id_5,
      id_9,
      id_9,
      id_6
  );
  always_ff @(1'b0 or posedge 1) begin : LABEL_0
    id_4 = -1'h0 === id_15;
    id_13 <= {id_1, 1, id_0, id_0};
  end
  logic id_18;
  ;
endmodule
