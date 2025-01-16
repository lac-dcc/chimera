// Seed: 2575135915
module module_0 (
    output wor id_0,
    input supply0 id_1,
    input supply0 id_2,
    output wire id_3,
    input supply0 id_4,
    input tri0 id_5,
    output wire id_6,
    input tri id_7,
    input wor id_8,
    input supply1 id_9,
    output supply1 id_10,
    output wire id_11,
    output tri0 id_12,
    input tri0 id_13,
    input tri0 id_14,
    output tri id_15,
    input supply0 id_16,
    output wor id_17
);
endmodule
module module_1 #(
    parameter id_4 = 32'd35,
    parameter id_5 = 32'd93,
    parameter id_6 = 32'd18,
    parameter id_7 = 32'd28,
    parameter id_8 = 32'd43
) (
    output wire id_0,
    input  wor  id_1,
    input  wor  id_2
);
  always $display(-1);
  always @(posedge id_1 == id_2 | -1'b0) assign id_0 = 1;
  defparam id_4 = 1'h0, id_5 = 1 ? -1 : 1, id_6 = -1, id_7 = 1'b0, id_8 = id_6;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_2,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.type_4 = 0;
  wire id_9;
endmodule
