// Seed: 713867260
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
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_7, id_8 = id_7;
  reg  id_9;
  reg  id_10;
  assign id_6 = 1'b0;
  assign id_2 = 1;
  wire id_11;
  always id_4 <= {1{id_6 ? id_10 : id_9}};
  assign id_9 = 1;
  reg id_12;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5,
      id_7
  );
  initial id_9 <= 1;
  assign id_3 = id_9;
  id_13(
      1'd0, id_4
  );
  or primCall (id_3, id_8, id_11, id_1, id_6, id_10, id_5, id_12);
  always id_9 <= id_12;
endmodule
