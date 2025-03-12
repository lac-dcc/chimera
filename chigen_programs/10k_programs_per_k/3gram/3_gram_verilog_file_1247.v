// Seed: 5445590
module module_0 (
    input wor id_0,
    input wire id_1,
    input uwire id_2,
    output wire id_3,
    input tri1 id_4
    , id_7,
    input supply1 id_5
);
  assign id_3 = id_7;
endmodule
module module_1 #(
    parameter id_0  = 32'd20,
    parameter id_1  = 32'd5,
    parameter id_12 = 32'd90
) (
    input wor _id_0,
    input tri _id_1,
    input supply1 id_2,
    output tri id_3,
    input tri1 id_4,
    output tri1 id_5,
    input wor id_6,
    input supply1 id_7,
    input wor id_8,
    input tri1 id_9,
    input wor id_10,
    output supply0 id_11,
    input supply0 _id_12
);
  logic [-1 : 1] id_14[id_12 : -1];
  wire id_15;
  wire [-1 : id_0] id_16;
  logic id_17;
  logic id_18;
  ;
  assign id_3 = id_1;
  logic [1 : id_1] id_19;
  and primCall (
      id_3, id_2, id_7, id_4, id_19, id_10, id_17, id_6, id_8, id_15, id_14, id_16, id_18, id_9
  );
  module_0 modCall_1 (
      id_6,
      id_9,
      id_2,
      id_5,
      id_9,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
