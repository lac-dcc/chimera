// Seed: 1662608366
module module_0 (
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
  inout wire id_1;
  supply0 id_7 = 1, id_8;
  assign module_2.type_2 = 0;
  assign module_1.id_1   = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output supply1 id_1
);
  assign id_1 = 1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  supply1 id_5 = 1;
endmodule
module module_2 (
    input wor id_0,
    input logic id_1,
    output supply1 id_2,
    input tri1 id_3,
    input wire id_4,
    input wire id_5,
    output logic id_6,
    input uwire id_7,
    input tri1 id_8,
    input wor id_9,
    input tri1 id_10,
    output supply1 id_11,
    input wor id_12,
    output wor id_13,
    output supply0 id_14,
    input tri id_15,
    input tri1 id_16,
    input wire id_17
);
  assign id_2 = 1 | (id_8);
  wire  id_19;
  uwire id_20;
  always @(posedge id_3 - id_12) begin : LABEL_0
    #(id_16);
    if (id_15) begin : LABEL_0
      id_20 = id_4;
      id_2  = 1;
    end else id_6 <= id_1;
  end
  assign id_13 = 1;
  tri0 id_21;
  wire id_22;
  module_0 modCall_1 (
      id_22,
      id_19,
      id_22,
      id_19,
      id_22,
      id_22
  );
  wire id_23;
endmodule
