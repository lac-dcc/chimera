// Seed: 4205386115
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  id_7(
      id_6#(.id_3(1'h0)), id_6
  );
  wire id_8;
  wire id_9;
endmodule
module module_1 #(
    parameter id_8 = 32'd50,
    parameter id_9 = 32'd93
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  tri id_7;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_7,
      id_3,
      id_4,
      id_1
  );
  always @(1 == id_1 or posedge 1) id_7 = id_3 == 1;
  generate
    defparam id_8.id_9 = id_6;
    for (id_10 = id_2; id_4; id_7 = 1) begin : LABEL_0
      wire id_11;
    end
  endgenerate
  nor primCall (id_1, id_4, id_3, id_2, id_6, id_7, id_5);
  wire id_12;
endmodule
