// Seed: 1827325075
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  assign id_2 = id_1;
  wire id_3, id_4;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2#(.id_3(-1)),
    id_4,
    id_5,
    id_6
);
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3.id_5 = {-1};
  module_0 modCall_1 (
      id_2,
      id_1
  );
  logic [7:0] id_7 = id_4;
  bit id_8, id_9;
  wire id_10;
  assign id_8 = -1;
  assign id_9 = 1;
  always begin : LABEL_0
    if (-1) id_5 = id_9;
    else
      @(posedge 1 or -1 & 1) begin : LABEL_0
        begin : LABEL_0
          id_8 <= id_9;
        end
        id_5 = id_8;
      end
  end
endmodule
