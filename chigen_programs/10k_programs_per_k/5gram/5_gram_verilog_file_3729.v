// Seed: 3135317803
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_6;
  assign id_5 = id_4;
endmodule
module module_1 #(
    parameter id_1 = 32'd66,
    parameter id_2 = 32'd76
) (
    output logic id_0,
    input  tri   _id_1,
    input  uwire _id_2,
    input  tri   id_3,
    input  tri0  id_4,
    input  tri0  id_5,
    input  tri0  id_6,
    input  tri   id_7,
    input  tri0  id_8
);
  localparam id_10 = -1;
  logic [7:0] id_11;
  assign id_11[id_1] = id_8;
  assign id_11[id_2] = id_10 < 1'b0;
  initial begin : LABEL_0
    id_0 <= 1'h0;
    id_0 <= -1;
  end
  assign id_0 = 1'b0;
  always @(posedge id_11 or id_11) begin : LABEL_1
    begin : LABEL_2
      if (1 == -1)
        if (id_10)
          if (id_10) begin : LABEL_3
            id_0 = -1;
          end else begin : LABEL_4
            id_0 <= id_5;
            for (id_0 = -1; id_10; id_0 = id_8 != -1) begin : LABEL_5
              id_0 = id_5 < id_4;
              id_0 <= id_10;
            end
          end
    end
  end
  logic id_12 = id_12;
  wire  id_13;
  assign id_11 = id_12;
  xor primCall (id_0, id_13, id_5, id_11, id_10);
  module_0 modCall_1 (
      id_12,
      id_13,
      id_10,
      id_12,
      id_12
  );
  wire id_14;
endmodule
