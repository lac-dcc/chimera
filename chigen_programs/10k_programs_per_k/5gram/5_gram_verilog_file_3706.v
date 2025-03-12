// Seed: 1026181872
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    input tri id_2
);
endmodule
module module_1 #(
    parameter id_0  = 32'd55,
    parameter id_12 = 32'd4,
    parameter id_3  = 32'd48
) (
    input supply0 _id_0,
    input supply1 id_1,
    input supply0 id_2,
    input supply0 _id_3,
    input tri1 id_4,
    output supply1 id_5,
    output tri1 id_6,
    output uwire id_7
);
  always @(posedge -1) begin : LABEL_0
    disable id_9;
  end
  bit  id_10;
  wire id_11;
  ;
  always @(posedge id_10) id_10 <= id_2;
  logic [-1 : id_0] _id_12;
  ;
  module_0 modCall_1 (
      id_7,
      id_1,
      id_4
  );
  assign modCall_1.id_0 = 0;
  wire [1 : id_3  ==  id_12] id_13;
  assign id_6 = id_10;
endmodule
