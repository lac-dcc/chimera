// Seed: 3661638859
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    module_0
);
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_8;
  wire id_9;
endmodule
module module_1 #(
    parameter id_5 = 32'd25
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input logic [7:0] id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  assign id_2[-1] = 1;
  always @(negedge -1 or posedge id_2) begin : LABEL_0
    deassign id_2;
  end
  wire _id_5;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign id_4 = id_3[id_5];
  bit id_6;
  always @(id_5)
    if (1) id_6 <= -1;
    else
      forever begin : LABEL_1
        fork
          begin : LABEL_2
          end
          repeat (1) begin : LABEL_3
            begin : LABEL_4
            end
            wait (-1'b0);
          end
        join
        id_7(.id_8(1));
      end
endmodule
