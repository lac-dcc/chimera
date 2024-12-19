// Seed: 2812332198
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge id_1 or id_3) begin : LABEL_0
    for (id_2 = 1'b0; id_4; id_4 = 1)
    #1 begin : LABEL_0
      if (1) begin : LABEL_0
        id_2 <= id_6 ^ 1;
      end else disable id_7;
    end
  end
  wire id_8;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_1,
      id_7
  );
  assign id_4 = id_2 ? id_3 == id_4 : 1;
endmodule
