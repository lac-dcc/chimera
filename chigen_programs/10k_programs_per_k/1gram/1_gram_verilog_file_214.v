// Seed: 3369897591
module module_0;
  logic id_1;
  tri0  id_2 = -1'b0;
endmodule
module module_1 #(
    parameter id_7 = 32'd40
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6#(._id_7(1)),
    id_8,
    id_9,
    id_10
);
  input wire id_9;
  output wire id_8;
  inout wire _id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  generate
    uwire [id_7 : 'b0] id_11 = id_7 - 1;
  endgenerate
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  logic id_12;
  id_13(
      -1
  );
  assign id_10 = id_9;
  logic id_14;
  and primCall (id_1, id_10, id_11, id_3, id_4, id_5, id_6, id_9);
endmodule
