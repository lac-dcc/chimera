// Seed: 685984320
module module_0 (
    input wire id_0,
    output supply1 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input tri1 id_4,
    input tri0 id_5,
    input tri id_6,
    input tri id_7,
    input wor id_8,
    output supply1 id_9,
    input uwire id_10,
    input supply1 id_11,
    input supply1 id_12
);
  assign id_1 = id_0;
endmodule
module module_1 #(
    parameter id_0 = 32'd77
) (
    input supply0 _id_0,
    input supply0 id_1,
    output uwire id_2,
    output wire id_3,
    output supply0 id_4
);
  always @(posedge -1) begin : LABEL_0
    assert (1 || id_1 || -1);
  end
  wire [id_0 : 1] id_6;
  assign id_2 = id_1 || -1'b0;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
