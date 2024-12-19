// Seed: 697132450
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6;
  wire id_7;
  wire id_8;
endmodule
module module_1 (
    input  logic id_0
    , id_3,
    output tri0  id_1
);
  reg id_4 = 1;
  initial begin : LABEL_0
    cover (1'd0);
    repeat (id_3 * 1) begin : LABEL_0
      begin : LABEL_0
        id_4 <= id_0;
      end
    end
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign id_4 = 1 ? id_4 : 1;
endmodule
