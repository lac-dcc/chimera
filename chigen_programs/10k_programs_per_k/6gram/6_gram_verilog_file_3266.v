// Seed: 1646434464
module module_0 (
    input supply0 id_0,
    input supply0 id_1,
    input supply0 id_2,
    output wor id_3
);
  always @(-1'b0) @(posedge id_0);
endmodule
module module_1 #(
    parameter id_0  = 32'd39,
    parameter id_11 = 32'd11,
    parameter id_2  = 32'd40,
    parameter id_4  = 32'd67
) (
    input supply0 _id_0,
    input wire id_1,
    input tri1 _id_2,
    input wand id_3,
    input uwire _id_4,
    output tri0 id_5,
    output wor id_6,
    input tri0 id_7,
    output logic id_8
);
  logic [7:0] id_10[id_2 : -1] = id_7;
  logic [{  -1  ,  id_0  } : id_4] _id_11 = 1;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_7,
      id_5
  );
  assign modCall_1.id_3 = 0;
  timeunit 1ps;
  always @(posedge id_1 or posedge -1'b0) begin : LABEL_0
    id_8 <= id_10[1<id_11];
  end
endmodule
