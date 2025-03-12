// Seed: 2254843
module module_0 (
    input  tri   id_0,
    output uwire id_1
);
  assign id_1 = id_0;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    output tri0 id_2
);
  wire id_4;
  ;
  module_0 modCall_1 (
      id_0,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
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
    module_2,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  input wire id_19;
  output wire id_18;
  input wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_20;
  ;
endmodule
module module_3 #(
    parameter id_3 = 32'd18
) (
    id_1,
    id_2,
    _id_3,
    id_4
);
  input logic [7:0] id_4;
  input wire _id_3;
  output wire id_2;
  inout tri0 id_1;
  module_2 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1
  );
  generate
    for (id_5 = 1; id_3; id_5 = "" == 1 - -1) begin : LABEL_0
      assign id_1 = -1;
      always @(id_4[id_3] or posedge id_3) begin : LABEL_1
        id_5 <= id_5;
        disable id_6;
      end
    end
  endgenerate
endmodule
