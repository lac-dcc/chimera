// Seed: 1858078169
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5 = id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = 1 ? id_5 : 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_3,
      id_4
  );
endmodule
module module_2 (
    output supply1 id_0,
    input wire id_1,
    input wire id_2,
    output wand id_3,
    input uwire id_4,
    input wor id_5
);
  wire id_7 = id_7, id_8;
endmodule
module module_3 (
    input tri1 id_0,
    output tri0 id_1,
    input tri1 id_2,
    output tri1 id_3
    , id_16,
    input supply1 id_4,
    input uwire id_5,
    input tri0 id_6,
    input uwire id_7,
    input tri1 id_8,
    output wor id_9,
    output tri0 id_10,
    output supply1 id_11,
    input wor id_12,
    input supply1 id_13,
    output supply0 id_14
);
  wire id_17;
  module_2 modCall_1 (
      id_3,
      id_5,
      id_13,
      id_1,
      id_4,
      id_5
  );
  id_18(
      id_10, 1, id_1, id_8, 1, 1
  );
  supply1 id_19;
  supply0 id_20;
  assign id_9 = 1;
  assign id_9 = id_19;
  wire id_21;
  always @(posedge 1) begin : LABEL_0
    id_20 = id_5 == id_13;
  end
  tri0 id_22 = {1'b0 && id_7 == id_19{1}};
endmodule
