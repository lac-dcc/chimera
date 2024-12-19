// Seed: 1868977424
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_16;
endmodule
module module_1 (
    output tri0 id_0,
    input tri0 id_1,
    output supply1 id_2
);
  assign id_0 = 1'b0;
  always @(posedge id_1 or posedge 1) begin : LABEL_0
    cover (id_1);
  end
  wire id_4;
  xor primCall (id_2, id_4, id_1, id_5, id_7, id_8, id_6);
  wire id_5;
  wire id_6;
  wire id_7;
  wire id_8;
  assign id_6 = id_4;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_6,
      id_7,
      id_5,
      id_6,
      id_7,
      id_4,
      id_4,
      id_4,
      id_8,
      id_6,
      id_4,
      id_4
  );
endmodule
