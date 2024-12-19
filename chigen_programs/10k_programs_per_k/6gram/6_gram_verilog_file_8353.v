// Seed: 3843689974
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  generate
    if (id_5) begin : LABEL_0
      assign id_7 = id_5 ? id_2 : 1;
    end
  endgenerate
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
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  tri1 id_8;
  wire id_9 = id_7[1 : 1];
  wire id_10;
  wire id_11;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_10,
      id_9,
      id_9,
      id_10,
      id_11,
      id_8,
      id_1
  );
  always @({1,
    1
  })
  begin : LABEL_0
    id_3 <= id_8 ==? 1;
  end
endmodule
