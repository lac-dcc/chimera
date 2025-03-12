// Seed: 548589135
module module_0 #(
    parameter id_13 = 32'd72
) (
    output tri1 id_0,
    input wand id_1,
    output uwire id_2,
    input tri1 id_3,
    output wire id_4,
    input supply1 id_5,
    output tri id_6,
    input supply1 id_7
);
  wire id_9;
  ;
  wire id_10, id_11, id_12, _id_13, id_14, id_15, id_16, id_17, id_18;
  struct packed {logic [1 : id_13] id_19;} [-1 : -1] id_20;
  ;
  assign id_15 = id_20;
  logic id_21;
endmodule
module module_1 #(
    parameter id_3 = 32'd98,
    parameter id_7 = 32'd80
) (
    input tri0 id_0,
    input wire id_1,
    input wire id_2,
    input supply1 _id_3,
    input supply0 id_4,
    input tri0 id_5,
    input tri1 id_6,
    input supply1 _id_7,
    input tri id_8,
    input wire id_9,
    output tri id_10
);
  module_0 modCall_1 (
      id_10,
      id_1,
      id_10,
      id_9,
      id_10,
      id_2,
      id_10,
      id_1
  );
  assign modCall_1.id_5 = 0;
  reg [-1 'b0 : id_3  ==  id_7] id_12;
  tri id_13;
  always @(-1'b0 or posedge -1) begin : LABEL_0
    id_12 <= id_8;
    id_12 = id_5;
  end
  assign id_13 = 1 == 1;
  assign id_10 = id_0;
endmodule
