// Seed: 1614024008
module module_0 (
    input supply0 id_0,
    input tri id_1,
    input supply1 id_2,
    output uwire id_3,
    input supply0 id_4,
    output wor id_5,
    input wand id_6,
    output supply1 id_7,
    input tri id_8,
    output supply1 id_9,
    input uwire id_10,
    input wand id_11,
    input tri0 id_12
);
  assign id_5 = id_2;
endmodule
module module_1 #(
    parameter id_0  = 32'd82,
    parameter id_10 = 32'd21,
    parameter id_12 = 32'd93,
    parameter id_3  = 32'd34,
    parameter id_4  = 32'd39
) (
    input uwire _id_0,
    output uwire id_1,
    input wire id_2,
    input uwire _id_3,
    input tri0 _id_4,
    output logic id_5,
    input tri0 id_6,
    output supply0 id_7
);
  supply0 [id_4 : 1] id_9 = -1, _id_10 = -1;
  always @(posedge -1'b0) id_5 <= 1;
  wire [id_4 : id_10] id_11 = id_0;
  assign id_5 = id_4 ? id_3 : id_11;
  initial begin : LABEL_0
    $unsigned(80);
    ;
  end
  wor [(  1 'b0 ) : id_3  |  id_3  -  -1] _id_12 = -1;
  supply0 id_13 = -1'b0;
  logic [(  id_12  ) : id_0] id_14;
  logic id_15;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_2,
      id_1,
      id_2,
      id_1,
      id_6,
      id_1,
      id_2,
      id_7,
      id_6,
      id_2,
      id_6
  );
  assign modCall_1.id_9 = 0;
  logic id_16;
  wire  id_17;
  ;
endmodule
