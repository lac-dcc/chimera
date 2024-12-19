// Seed: 794568004
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
    id_10,
    id_11
);
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_12(
      .id_0(1), .id_1(1), .id_2(1)
  );
  assign id_8 = 1;
  supply0 id_13;
  assign module_1.type_7 = 0;
  id_14 :
  assert property (@(posedge id_4 + id_4 or posedge 1'd0) 1'h0)
  else;
  assign id_13 = 1;
endmodule
module module_1 (
    output uwire id_0,
    input wor id_1,
    output uwire id_2,
    input wire id_3,
    input uwire id_4,
    input tri0 id_5,
    output tri1 id_6,
    input tri0 id_7,
    input wor id_8,
    input uwire id_9,
    input tri1 id_10,
    input wor id_11,
    input supply0 id_12
);
  assign id_6 = id_4;
  assign id_6 = id_1;
  wire id_14;
  assign id_0 = id_1 + 1'b0;
  always
    if ((id_8)) begin : LABEL_0
      #1;
    end
  module_0 modCall_1 (
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14
  );
endmodule
