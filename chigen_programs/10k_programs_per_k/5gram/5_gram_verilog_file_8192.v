// Seed: 1045281623
module module_0 (
    input tri   id_0,
    input uwire id_1,
    input uwire id_2
);
  assign module_1.type_23 = 0;
  wire id_4;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    input supply1 id_2,
    input tri id_3,
    input logic id_4,
    input wor id_5,
    input supply0 id_6,
    input supply1 id_7,
    output supply0 id_8,
    input wor id_9,
    output wire id_10,
    input wand id_11,
    input tri id_12,
    output logic id_13,
    output uwire id_14
);
  assign id_14 = id_0;
  assign id_8  = 1'd0;
  generate
    if (id_9 - 1) begin : LABEL_0
      always @(posedge id_8++or id_6 ==? 1) id_13 <= id_4;
      wire id_16, id_17;
    end else begin : LABEL_0
      wire id_18;
    end
  endgenerate
  module_0 modCall_1 (
      id_7,
      id_2,
      id_6
  );
endmodule
