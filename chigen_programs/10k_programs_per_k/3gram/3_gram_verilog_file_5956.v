// Seed: 2754609980
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge 1) id_1 <= 1'b0;
  assign module_1.id_9 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  logic [7:0] id_8;
  uwire id_9, id_10;
  reg id_11;
  assign id_5[1] = 1;
  module_0 modCall_1 (
      id_11,
      id_9,
      id_10,
      id_9,
      id_9,
      id_10,
      id_6
  );
  assign id_10 = 1;
  assign id_11 = {id_11, id_11};
  assign id_9  = id_9;
  always @(posedge 1'b0) id_11 <= 1;
  notif1 primCall (id_1, id_10, id_9);
  wire id_12;
  always disable id_13;
endmodule
