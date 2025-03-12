// Seed: 979438642
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  assign module_1.id_3 = 0;
  output wire id_2;
  output wire id_1;
  wire id_5;
endmodule
module module_1 #(
    parameter id_3 = 32'd22,
    parameter id_7 = 32'd28
) (
    output supply1 id_0,
    output supply0 id_1,
    input supply1 id_2,
    input supply0 _id_3,
    input tri1 id_4,
    input supply0 id_5
);
  wire _id_7;
  wire [id_3 : id_7] id_8;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_8
  );
  wire id_9;
  struct packed {
    logic id_10[-1 : -1];
    logic id_11;
    logic id_12;
    logic id_13;
  } id_14;
  assign id_14.id_10 = -1 ? 1 : ({id_2, id_5});
endmodule
