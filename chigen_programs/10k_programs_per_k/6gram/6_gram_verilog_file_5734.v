// Seed: 4013435149
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_8 = id_2;
  always @(posedge id_6) id_2 <= 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always
    if (1'b0) id_1 <= id_4 == "";
    else id_6 <= id_3;
  wire id_7;
  assign id_3 = id_5;
  module_0(
      id_4, id_3, id_7, id_2, id_4, id_4, id_2, id_1
  );
endmodule
