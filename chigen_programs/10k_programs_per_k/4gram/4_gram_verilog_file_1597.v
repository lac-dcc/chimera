// Seed: 1342302862
module module_0 #(
    parameter id_10 = 32'd54,
    parameter id_8  = 32'd67
) (
    input tri1 id_0,
    output tri1 id_1,
    input supply1 id_2,
    input uwire id_3
    , _id_8,
    output wor id_4,
    input uwire id_5,
    input tri1 id_6
);
  assign id_1 = -1;
  logic id_9, _id_10;
  wire id_11;
  logic [id_10 : id_8] id_12;
endmodule
module module_1 #(
    parameter id_0 = 32'd67
) (
    input supply1 _id_0,
    input tri0 id_1,
    output wor id_2,
    input supply1 id_3
);
  logic id_5;
  nor primCall (id_2, id_9, id_5, id_10);
  wire [id_0 : 1] id_6;
  wire id_7;
  wire id_8;
  logic id_9;
  ;
  localparam id_10 = -1'h0;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_1,
      id_2,
      id_3,
      id_1
  );
  assign modCall_1.id_10 = 0;
  wire id_11;
  wire id_12 = id_12;
endmodule
