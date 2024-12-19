// Seed: 3217954637
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  supply0 id_4 = 1;
  assign id_4 = 1'b0;
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
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_13;
  assign id_12[1'h0] = 1'd0;
  always @(posedge id_5 or posedge 1) begin : LABEL_0
    wait (1'b0);
    id_12 = id_6;
  end
  module_0 modCall_1 (
      id_8,
      id_5,
      id_8
  );
  assign modCall_1.type_5 = 0;
  and primCall (id_8, id_10, id_6, id_5, id_3, id_4, id_2, id_13, id_1);
  always @(posedge 1 or id_5) #1;
endmodule
