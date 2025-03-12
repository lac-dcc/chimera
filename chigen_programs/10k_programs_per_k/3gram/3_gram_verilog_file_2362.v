// Seed: 503621821
module module_0 #(
    parameter id_3 = 32'd92
) (
    input  uwire id_0,
    output tri0  id_1
);
  logic _id_3;
  assign module_1.id_10 = 0;
  wire [id_3 : 1] id_4;
endmodule
module module_1 #(
    parameter id_5 = 32'd0
) (
    output supply0 id_0,
    output tri id_1,
    input wor id_2,
    input wand id_3,
    input supply1 id_4,
    input uwire _id_5,
    input tri0 id_6
);
  assign id_0 = id_5;
  logic [7:0][1 : id_5] id_8;
  logic id_9;
  module_0 modCall_1 (
      id_2,
      id_0
  );
  logic [id_5 : 1] id_10;
  logic id_11;
  assign id_8[-1] = {1 - {id_10, 1'h0} {id_2 >= id_4}};
  assign id_10 = 1;
endmodule
