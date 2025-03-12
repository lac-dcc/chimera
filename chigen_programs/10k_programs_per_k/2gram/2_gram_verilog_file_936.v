// Seed: 1616087229
module module_0 (
    input supply0 id_0,
    input supply0 id_1,
    output wor id_2,
    output wire id_3,
    input wor id_4,
    input supply1 id_5,
    output tri id_6,
    output tri1 id_7
    , id_16,
    input tri1 id_8,
    input tri0 id_9,
    output supply1 id_10,
    output supply1 id_11,
    output supply0 id_12,
    input supply0 id_13,
    input supply0 id_14
);
  assign module_1._id_9 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd86,
    parameter id_5 = 32'd98,
    parameter id_9 = 32'd5
) (
    input wire id_0,
    output wire id_1,
    input tri _id_2,
    input tri id_3
    , id_11,
    input tri id_4,
    input supply0 _id_5,
    input tri0 id_6,
    output supply1 id_7,
    input wor id_8,
    input wand _id_9
);
  struct packed {
    logic id_12;
    logic id_13;
    logic [1 : id_5] id_14;
    logic [id_9 : id_5] id_15;
  } [id_2 : {
1  -  id_9  ,  !  1  ,  1
}] id_16;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_7,
      id_1,
      id_8,
      id_8,
      id_7,
      id_1,
      id_4,
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_3
  );
  wire id_17;
  always_comb begin : LABEL_0
    $clog2(50);
    ;
    id_16.id_15 = -1 == 1;
  end
  assign id_7 = 1 == -1;
endmodule
