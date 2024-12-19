// Seed: 1657811078
module module_0 ();
  reg id_2;
  always
    if (1 & id_2)
      #1 begin : LABEL_0
        if (1'b0 ^ id_1) id_2 <= id_2;
      end
    else;
endmodule
module module_1;
  wire id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_3;
  always @(id_3 or posedge id_2) begin : LABEL_0
    if (1'b0) begin : LABEL_0
      id_1[{"", 1}] = id_2;
    end
  end
endmodule
module module_2 (
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
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge 1)
    if (id_7)
      if (1) id_12 <= 1;
      else id_12 <= id_5;
  xor primCall (id_1, id_10, id_13, id_14, id_15, id_2, id_3, id_4, id_5, id_6, id_7, id_8, id_9);
  module_0 modCall_1 ();
endmodule
