// Seed: 4186917606
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_2;
endmodule
module module_1 #(
    parameter id_4 = 32'd81
) (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2
  );
  inout wire id_2;
  output reg id_1;
  wire _id_4;
  always begin : LABEL_0
    @(negedge id_2 && 1'b0) begin : LABEL_1
      #1 begin : LABEL_2
        id_1 = id_2;
      end
    end
  end
  parameter id_5 = -1;
  reg id_6;
  always id_6 <= id_4;
  wire [id_4 : id_4] id_7;
endmodule
