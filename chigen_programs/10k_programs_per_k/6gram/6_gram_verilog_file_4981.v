// Seed: 2062061771
module module_0 #(
    parameter id_9 = 32'd66
) (
    input supply0 id_0,
    output tri0 id_1,
    input supply1 id_2,
    input tri0 id_3
    , _id_9,
    input wand id_4,
    input wire id_5,
    output tri id_6,
    input supply0 id_7
);
  wire [-1 : id_9] id_10;
  assign module_1.id_2 = 0;
  assign id_10 = id_4;
endmodule
module module_1 #(
    parameter id_0  = 32'd98,
    parameter id_12 = 32'd30
) (
    input tri _id_0
    , id_9,
    input tri1 id_1,
    output uwire id_2
    , id_10,
    output supply0 id_3,
    output wire id_4,
    output wor id_5
    , id_11,
    input uwire id_6,
    input tri0 id_7
);
  wire [id_0 : id_0] _id_12;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_7,
      id_6,
      id_1,
      id_1,
      id_2,
      id_1
  );
  always @(posedge id_12 or posedge -1'h0) begin : LABEL_0
    id_9[id_12] <= -1;
  end
endmodule
