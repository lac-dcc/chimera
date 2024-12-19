// Seed: 1302207316
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  logic [7:0] id_6, id_7, id_8, id_9;
  generate
    assign id_7 = id_7[1'b0/1];
  endgenerate
  assign module_2.id_1 = 0;
endmodule
module module_1;
  assign id_1 = 1 - id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  wire id_3;
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
    id_11
);
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  id_12 :
  assert property (@(*) id_10) begin : LABEL_0
    begin : LABEL_0
      @(posedge id_6)
      id_8.id_2#(
          .id_8 (1),
          .id_12(1),
          .id_8 (1),
          .id_8 (1)
      ) = 1'b0;
    end
    @(1 or posedge 1) if (1) id_12 <= id_8;
    begin : LABEL_0
      id_3 = id_10;
      id_1 <= 1;
    end
  end
  module_0 modCall_1 (
      id_11,
      id_4,
      id_11,
      id_11,
      id_5
  );
  tri0 id_13 = 1;
  assign id_13 = 1;
endmodule
