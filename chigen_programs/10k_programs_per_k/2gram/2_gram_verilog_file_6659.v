// Seed: 499855798
module module_0 (
    input wire id_0,
    input supply1 id_1,
    input tri id_2,
    input tri0 id_3,
    output supply0 id_4,
    output tri0 id_5,
    input wor id_6,
    input tri0 id_7
);
  wire id_9;
endmodule
module module_1 (
    output logic id_0,
    output supply0 id_1,
    input wor id_2
);
  always begin : LABEL_0
    id_0 <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2 #(
    parameter id_10 = 32'd4,
    parameter id_13 = 32'd15,
    parameter id_14 = 32'd40,
    parameter id_4  = 32'd84
) (
    output uwire id_0,
    input supply1 id_1,
    input uwire id_2,
    output wand id_3,
    input tri0 _id_4,
    input uwire id_5,
    input uwire id_6,
    input wand id_7,
    input wand id_8
);
  logic [-1 'b0 : 1] _id_10, id_11, id_12, _id_13, _id_14 = 1;
  wire id_15 = id_14;
  logic [id_4 : id_10] id_16;
  wor id_17 = -1;
  tri [id_14  &&  1 : 1] id_18 = 1;
  nand primCall (id_0, id_5, id_11, id_6, id_16, id_19, id_18, id_7);
  supply1 [id_13 : ""] id_19 = 1;
  assign id_12 = -1;
  localparam id_20 = 1;
  assign id_12 = 1;
  wire id_21;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_2,
      id_1,
      id_0,
      id_3,
      id_7,
      id_1
  );
endmodule
