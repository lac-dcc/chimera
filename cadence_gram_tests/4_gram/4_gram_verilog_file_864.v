// Seed: 2849232713
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
  wire id_4 = id_2;
  wire id_5;
  assign id_1 = id_5 == $realtime;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(posedge id_6 or posedge $realtime)
    if (-1) begin : LABEL_0
      if (1) begin : LABEL_0
        id_1 <= $realtime;
      end
    end else begin : LABEL_0
      if (1) id_4 = $realtime;
      else id_3 <= id_4 ? $realtime : id_1;
    end
  assign id_1 = id_4;
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_7
  );
  wire \id_9 , id_10;
endmodule
