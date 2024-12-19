// Seed: 3370486030
module module_0;
  assign id_1 = 1 | 1;
  assign id_1 = 1;
  reg id_2 = id_1;
  always begin : LABEL_0
    @(id_1 - (1)) begin : LABEL_0
      id_2 <= id_2;
      id_2 = id_2 - id_1;
      if (id_2) begin : LABEL_0$display
        ;
      end
    end
  end
  assign id_1 = id_1;
  reg id_3;
  assign id_2 = 1'b0;
  always begin : LABEL_0
    id_3 = id_2;
  end
  generate
    reg id_4;
    assign id_3 = id_4;
    id_5(
        .id_0(id_4), .id_1(id_1)
    );
    wire id_6;
    wire id_8;
  endgenerate
  assign id_7 = id_4;
endmodule
module module_1 (
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
    id_13
);
  output wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  genvar id_14;
  assign id_2[1==1] = 1'b0;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  initial id_1 = 1'b0;
endmodule
