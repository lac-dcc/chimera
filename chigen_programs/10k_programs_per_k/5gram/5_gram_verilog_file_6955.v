// Seed: 1215863760
module module_0 #(
    parameter id_3 = 32'd15
) (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  logic _id_3;
  wire [id_3 : (  id_3  )] id_4;
  wire id_5;
  wire id_6;
  wire id_7;
  assign id_7 = id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output tri0 id_2;
  module_0 modCall_1 (
      id_3,
      id_3
  );
  output wire id_1;
  assign id_2 = 1;
endmodule
module module_2 (
    input supply0 id_0,
    input uwire id_1
    , id_5,
    output supply1 id_2,
    input tri0 id_3
);
  logic id_6;
  wire  id_7;
  logic id_8;
  module_0 modCall_1 (
      id_7,
      id_7
  );
  initial begin : LABEL_0
    id_5 <= ~id_0;
  end
  wire [1 : 1] id_9;
  initial begin : LABEL_1
    id_6 = #1 id_5 / id_3;
    id_8 <= -1;
    #1;
  end
endmodule
