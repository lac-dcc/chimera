// Seed: 2351964564
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output supply0 id_2;
  input wire id_1;
  wire id_11;
  assign id_2 = -1'b0;
endmodule
module module_1 #(
    parameter id_1 = 32'd49,
    parameter id_3 = 32'd21
) (
    _id_1,
    id_2,
    _id_3,
    id_4
);
  inout wire id_4;
  output wire _id_3;
  output wire id_2;
  inout wire _id_1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4,
      id_4
  );
  struct packed {
    logic [id_3 : id_1] id_5;
    logic id_6;
    logic id_7;
  } [1 : -1 'b0] id_8;
  wire id_9;
endmodule
