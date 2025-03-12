// Seed: 3393470335
module module_0 (
    output tri0 id_0,
    input wor id_1,
    input tri1 id_2,
    input supply1 id_3,
    output tri id_4,
    input tri id_5,
    input supply1 id_6,
    input supply0 id_7
);
  assign id_4 = -1;
endmodule
module module_1 #(
    parameter id_2 = 32'd53,
    parameter id_4 = 32'd63,
    parameter id_6 = 32'd8,
    parameter id_7 = 32'd62,
    parameter id_8 = 32'd68
) (
    output supply0 id_0,
    output logic id_1,
    output supply1 _id_2,
    input supply0 id_3,
    input tri _id_4,
    output tri1 id_5,
    input wor _id_6[id_2  +  1 : id_8],
    inout uwire _id_7,
    input tri _id_8,
    output tri id_9,
    output tri0 id_10,
    input wire id_11,
    input wire id_12,
    input supply0 id_13
);
  assign id_9 = ~-1'b0;
  logic id_15;
  wire  id_16 [-1  +  1 : id_4];
  wire [id_7 : id_6] id_17, id_18[-1 : 1], id_19;
  assign id_0 = -1;
  id_20 :
  assert property (@(*) id_18) begin : LABEL_0
    id_1 = id_19;
  end
  module_0 modCall_1 (
      id_5,
      id_11,
      id_11,
      id_13,
      id_9,
      id_11,
      id_3,
      id_11
  );
  assign modCall_1.id_6 = 0;
  logic [-1 : id_4] id_21;
endmodule
