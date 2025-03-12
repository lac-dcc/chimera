// Seed: 1265198925
module module_0 (
    input wand id_0,
    output tri id_1,
    output tri1 id_2,
    output supply1 id_3,
    input wand id_4,
    output wire id_5
);
  assign id_3 = 1;
  assign module_1._id_1 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd38,
    parameter id_7 = 32'd59
) (
    input tri1 id_0,
    input supply0 _id_1,
    input tri1 id_2,
    input tri0 id_3,
    input tri0 id_4,
    input tri id_5,
    output wire id_6,
    input tri1 _id_7,
    input tri0 id_8,
    input wand id_9,
    input supply1 id_10,
    output supply1 id_11,
    output logic id_12,
    output supply1 id_13
);
  assign id_13 = 1;
  wire [id_1 : ~  id_7] id_15;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_13,
      id_6,
      id_8,
      id_13
  );
  always @(posedge id_9 or posedge id_15) id_12 = 1'd0;
endmodule
