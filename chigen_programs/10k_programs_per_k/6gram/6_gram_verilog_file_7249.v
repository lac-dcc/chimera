// Seed: 2033391396
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_0 = 32'd86,
    parameter id_1 = 32'd14
) (
    input wand _id_0,
    input supply1 _id_1,
    output supply1 id_2,
    output logic id_3
);
  wire [  id_0 : -1] id_5;
  wire [id_0 : id_1] id_6;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5
  );
  assign id_6 = id_1;
  always @(id_5 or posedge id_5) id_3 = id_6;
endmodule
