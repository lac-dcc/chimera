// Seed: 3456655756
module module_0 (
    input wor id_0,
    output tri1 id_1,
    input supply0 id_2,
    input tri id_3,
    input tri0 id_4,
    output supply0 id_5
);
  wire id_7;
  ;
  wire  id_8;
  logic module_0;
  ;
  logic id_9;
endmodule
module module_1 #(
    parameter id_1  = 32'd95,
    parameter id_10 = 32'd82,
    parameter id_5  = 32'd45
) (
    output supply1 id_0,
    input tri0 _id_1,
    input wor id_2,
    input tri0 id_3,
    output wor id_4,
    input supply1 _id_5,
    output wand id_6,
    output wor id_7,
    output wor id_8
);
  wire _id_10 = id_2;
  wire [id_1 : id_5] id_11;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_3,
      id_2,
      id_3,
      id_4
  );
  assign modCall_1.id_5 = 0;
  wire [1 : id_10] id_12;
  logic id_13, id_14;
  always @(posedge -1 / id_12) begin : LABEL_0
    deassign id_10;
  end
endmodule
