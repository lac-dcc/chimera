// Seed: 453542388
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
  reg id_4;
  reg id_5;
  final
    @(posedge id_4 & 1)
      if (1)
        @(1'd0) begin : LABEL_0
          release id_5;
        end
      else begin : LABEL_0
        wait (id_2);
        id_4 <= 1'b0;
      end
  initial begin : LABEL_0
    id_5 <= 1'b0;
  end
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
    id_9
);
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_10;
  xor primCall (id_5, id_10, id_8, id_6, id_4, id_2, id_7, id_1, id_3);
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
