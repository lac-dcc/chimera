// Seed: 3864544812
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input tri1 id_2,
    output tri1 id_3,
    output wor id_4,
    output supply1 id_5,
    input supply0 module_0,
    output tri0 id_7,
    output supply0 id_8,
    input wire id_9
);
  wire id_11;
  ;
  always_latch @(posedge 1) begin : LABEL_0
    disable id_12;
  end
endmodule
module module_1 #(
    parameter id_6 = 32'd44
) (
    input tri1 id_0
    , id_8,
    input tri0 id_1,
    output tri id_2,
    output logic id_3,
    output wire id_4,
    input uwire id_5,
    input supply1 _id_6
);
  always @(posedge id_8[1'b0 : id_6] - id_5 or posedge id_5) id_3 = "";
  assign id_3 = 1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_2,
      id_2,
      id_2,
      id_1,
      id_4,
      id_2,
      id_5
  );
  assign modCall_1.id_8 = 0;
endmodule
