// Seed: 216037764
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = 1'h0;
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
    id_9,
    id_10
);
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  always id_7 <= #id_10 1;
  assign id_1[1] = id_3;
  assign id_5 = 1;
  always @(id_10 or posedge id_3) begin : LABEL_0
    id_4[1-1'b0] <= -id_10;
  end
  wire id_11;
  xor primCall (id_8, id_9, id_2, id_3, id_11, id_12, id_10);
  wire id_12;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11
  );
endmodule
