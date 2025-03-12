// Seed: 2879958287
module module_0 (
    input tri0 id_0,
    input tri id_1,
    output tri id_2,
    input tri1 id_3,
    input tri id_4,
    output tri id_5,
    input tri id_6,
    input uwire id_7,
    input uwire id_8,
    input wand id_9,
    output supply0 id_10,
    input wire id_11,
    output wand module_0,
    input supply0 id_13,
    output tri0 id_14,
    input wire id_15,
    input wor id_16
);
  wire id_18;
  assign module_1.id_9 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd28
) (
    input uwire id_0,
    input tri0 id_1,
    inout supply1 _id_2,
    input wor id_3,
    output wand id_4
    , id_14,
    input tri1 id_5,
    input tri0 id_6,
    output tri1 id_7,
    output wire id_8,
    output supply1 id_9,
    input tri1 id_10,
    input uwire id_11,
    input supply0 id_12
);
  logic id_15;
  ;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_4,
      id_12,
      id_5,
      id_9,
      id_6,
      id_5,
      id_11,
      id_3,
      id_8,
      id_3,
      id_4,
      id_3,
      id_9,
      id_12,
      id_6
  );
  always @(-1 or id_14 or posedge id_5) begin : LABEL_0
    if (1) begin : LABEL_1
      id_14[1 : id_2] <= -1;
      {-1, {1{id_3}}} <= id_15;
    end
  end
endmodule
