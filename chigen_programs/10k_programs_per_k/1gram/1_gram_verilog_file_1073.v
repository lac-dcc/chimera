// Seed: 178787927
module module_0 #(
    parameter id_8 = 32'd31
) (
    input  tri1  id_0,
    output uwire id_1
);
  assign id_1 = -1'b0;
  assign id_1 = 1'b0;
  assign id_1 = 1;
  logic id_3;
  logic id_4;
  struct packed {
    logic id_5;
    id_6  id_7;
  } _id_8;
  ;
  wire [1  &&  (  id_8  ) : id_8] id_9;
  assign id_8.id_5 = 1;
  assign id_4 = id_0 && id_8.id_5;
  assign module_1._id_8 = 0;
  wire id_10;
endmodule
module module_1 #(
    parameter id_8 = 32'd11
) (
    input uwire id_0,
    input supply1 id_1,
    output supply0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input wor id_6,
    output wor id_7,
    input supply0 _id_8,
    output supply1 id_9
);
  wire [id_8 : ~|  1] id_11, id_12;
  wire id_13;
  union packed {
    logic id_14;
    logic id_15;
  } id_16;
  ;
  module_0 modCall_1 (
      id_0,
      id_2
  );
endmodule
