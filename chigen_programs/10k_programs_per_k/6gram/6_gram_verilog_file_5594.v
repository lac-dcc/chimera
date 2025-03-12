// Seed: 1125452498
module module_0 (
    output wand  id_0,
    input  tri0  id_1,
    output uwire id_2,
    input  tri   id_3,
    input  tri0  id_4,
    input  wire  id_5
);
endmodule
module module_1 #(
    parameter id_0 = 32'd12
) (
    input wand _id_0,
    output wor id_1,
    input tri id_2,
    input supply1 id_3,
    output logic id_4,
    input supply1 id_5,
    output wire id_6
);
  wor [-1 : 1] id_8;
  assign id_8 = id_0 ? -1 == 1 : id_8 ? 1 : {-1, id_0} ? id_0 : id_5 ~^ -1'd0 ? -1 : id_0 == id_2;
  wire id_9;
  always @("") begin : LABEL_0
    id_4 <= (~id_8) ** -1;
  end
  assign id_8 = 1'b0;
  wire id_10;
  logic [id_0 : -1] id_11;
  ;
  assign id_6 = id_8;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_6,
      id_5,
      id_5,
      id_5
  );
  assign modCall_1.id_5 = 0;
endmodule
