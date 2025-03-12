// Seed: 331001806
module module_0 (
    input supply1 id_0,
    input supply1 module_0,
    input supply1 id_2,
    output wand id_3,
    input tri0 id_4,
    output tri1 id_5,
    input wire id_6,
    input tri1 id_7,
    input wand id_8
);
  assign id_3 = id_8;
  assign id_5 = {id_8{1}};
  assign module_1.id_0 = 0;
  always disable id_10;
endmodule
module module_1 #(
    parameter id_9 = 32'd41
) (
    output wor id_0,
    output tri id_1,
    input supply1 id_2
);
  logic [7:0] id_4;
  wire id_5;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2
  );
  supply1 id_6 = id_2 != 1;
  parameter id_7 = 1;
  wire  id_8;
  wire  _id_9;
  logic id_10 = id_4;
  assign id_10 = id_2;
  logic id_11;
  logic [7:0] id_12;
  assign id_12[id_9==1] = 1 ? id_5 : id_12;
  wire  id_13;
  logic id_14;
  ;
  assign id_14 = ~id_7;
  always id_10 = @(-1) id_7;
  always @(posedge id_2 or posedge 1) id_4[1] <= id_2;
  parameter id_15 = 1 == id_7;
  logic id_16;
  ;
  always @(-1 or posedge id_4) begin : LABEL_0
    if (1'b0) begin : LABEL_1
      id_16 <= id_15;
    end
  end
endmodule
