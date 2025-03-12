// Seed: 4058335422
module module_0 #(
    parameter id_6 = 32'd7,
    parameter id_7 = 32'd45
) (
    input tri1 id_0,
    input supply0 id_1,
    output wor id_2,
    input tri0 id_3,
    output supply1 id_4,
    output supply0 id_5,
    input tri _id_6,
    input tri1 _id_7,
    output tri1 id_8,
    input supply1 id_9,
    input uwire id_10,
    output tri1 id_11
);
  wire [id_7 : id_6] id_13;
  assign module_1.id_0 = 0;
  if (-1) begin : LABEL_0
    assign id_4 = id_6;
  end else wire id_14;
  assign id_8 = 1;
  assign id_5 = 1;
  logic id_15;
  ;
  wire [1 : {  -1  ,  !  -1  }] id_16;
  assign id_16 = id_15;
  assign id_5  = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd96
) (
    output wor  id_0,
    input  wand id_1
);
  always
  fork
  join_none
  wire [-1 'b0 : 1] id_3;
  parameter id_4 = 1;
  tri id_5 = 1'h0;
  wire [1 'h0 : id_4] id_6;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_4,
      id_4,
      id_0,
      id_1,
      id_1,
      id_0
  );
  parameter id_7 = id_4;
endmodule
