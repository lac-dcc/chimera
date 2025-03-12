// Seed: 1069560381
module module_0 (
    input tri id_0,
    output supply0 id_1,
    output supply1 id_2,
    input tri id_3,
    input tri0 id_4,
    output tri1 id_5,
    output wand id_6
    , id_13,
    input supply0 id_7,
    input tri0 id_8,
    input wire id_9,
    input uwire id_10,
    input tri1 id_11
);
  wire id_14;
endmodule
module module_1 #(
    parameter id_8 = 32'd39
) (
    input tri id_0,
    output tri id_1,
    input wand id_2,
    output wand id_3,
    output supply1 id_4,
    output logic id_5
    , _id_8,
    output supply0 id_6
);
  assign id_1 = -1;
  always @(posedge id_2) begin : LABEL_0
    id_5 <= id_2;
  end
  wire [1 : id_8] id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_1,
      id_2,
      id_2,
      id_3,
      id_3,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2
  );
  assign id_3 = id_14 ? id_11 : id_9 & 1'b0;
  assign id_4 = 1'b0;
  wire id_17;
  wire [1  -  1 : -1] id_18;
  assign {1, -1 + 1} = 1;
  assign id_12 = id_15;
  assign id_1 = -1 + id_16;
endmodule
