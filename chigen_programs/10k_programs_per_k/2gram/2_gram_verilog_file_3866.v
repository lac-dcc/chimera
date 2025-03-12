// Seed: 3840901441
module module_0 #(
    parameter id_12 = 32'd64
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5#(
        .id_6(id_7),
        .id_8(-1),
        .id_9(1)
    ),
    id_10,
    id_11
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_9 = 1;
  wire _id_12;
  assign id_7 = id_6;
  always @(posedge id_8 or posedge id_6) id_11[id_12] = id_9;
  assign id_12 = id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout tri id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_5,
      id_9,
      id_6,
      id_4,
      id_7
  );
  assign id_8 = {id_8, 1};
endmodule
