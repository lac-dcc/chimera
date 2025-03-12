// Seed: 855713329
module module_0 (
    input  tri0 id_0,
    input  tri0 id_1,
    output tri0 id_2
);
  assign id_2 = id_1;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd60,
    parameter id_3 = 32'd4
) (
    input tri id_0,
    output supply1 id_1,
    input wand _id_2,
    input supply1 _id_3
);
  wire [id_3 : id_2] id_5;
  reg id_6;
  logic id_7;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1
  );
  wire id_8;
  wire id_9;
  always @((id_3) or posedge -1) begin : LABEL_0
    id_7 <= id_0;
    id_6 = {id_5 ^ id_5, id_2, 1, id_8};
  end
endmodule
