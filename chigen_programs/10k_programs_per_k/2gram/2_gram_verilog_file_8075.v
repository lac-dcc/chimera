// Seed: 2215597596
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign module_2.id_2 = 0;
  integer id_4;
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_1
  );
  inout wire id_1;
  logic id_6;
  ;
endmodule
module module_2 (
    output wand id_0,
    output tri0 id_1,
    input tri0 id_2,
    output wor id_3,
    output wire id_4,
    output wand id_5,
    input supply0 id_6,
    input supply0 id_7
    , id_14,
    output supply0 id_8,
    output supply0 id_9,
    input supply1 id_10,
    input tri1 id_11,
    output logic id_12
);
  wire id_15;
  wire id_16;
  logic [-1 'b0 : 1  +  1] id_17;
  ;
  module_0 modCall_1 (
      id_14,
      id_17,
      id_14
  );
  always @(negedge -1'b0 or posedge 1 or -1) begin : LABEL_0
    begin : LABEL_1
      id_12 = id_11 == id_10;
    end
  end
  localparam id_18 = 1;
endmodule
