// Seed: 2910941299
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    forever begin : LABEL_1
      if (-1) begin : LABEL_2
        $unsigned(24);
        ;
      end
    end
  end
  wire [1 : 1] id_8;
  parameter id_9 = 1;
  localparam id_10 = id_9;
  assign id_5 = id_3;
  wire id_11;
  ;
  logic id_12 = id_10#(.id_11({id_10 != "", id_9[1+1], 1})) == -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_4,
      id_1,
      id_4,
      id_5
  );
endmodule
