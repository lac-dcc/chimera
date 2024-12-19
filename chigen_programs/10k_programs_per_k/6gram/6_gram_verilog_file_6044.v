// Seed: 241938070
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
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = 1;
  supply0 id_10 = 1 - id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
  reg id_6;
  always @(*) begin : LABEL_0
    fork
      begin : LABEL_0
        id_6 <= 1'b0;
        id_6 <= id_2;
        id_4 = id_1[1 : 1];
      end
      repeat (1) begin : LABEL_0
        #(1'd0);
        id_4[1 : 1] <= 1 - id_6;
        id_6 <= 1;
        id_6 <= id_6;
      end
    join
  end
endmodule
