// Seed: 4141972369
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    input wire id_2,
    output logic id_3
);
  always @(*) id_3 <= -1;
endmodule
module module_1 #(
    parameter id_6 = 32'd63
) (
    output uwire id_0,
    input wand id_1,
    input supply0 id_2,
    output supply0 id_3,
    output logic id_4
    , id_9,
    input uwire id_5,
    input wand _id_6,
    input tri id_7
);
  wire [-1 : id_6] id_10, id_11, id_12;
  assign id_4 = id_5;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_1,
      id_4
  );
  assign modCall_1.id_0 = 0;
  always @(posedge 1) begin : LABEL_0
    id_4 <= id_10;
  end
  wire id_13;
endmodule
