// Seed: 3390923103
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_11;
  wire id_12;
  supply0 id_13 = 1 == id_5;
  assign id_7  = 1;
  assign id_10 = id_12;
  always if ((1) + id_1) id_7 <= (1);
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
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  tri0 id_10;
  wand id_11 = 1;
  assign id_7 = 1;
  wire id_12;
  always @(posedge id_12 or negedge id_4) begin : LABEL_0
    id_10 = 1'h0;
  end
  reg id_13;
  initial begin : LABEL_0
    id_5 <= id_13;
    fork
      begin : LABEL_0
        id_3 += (id_11);
        id_7 = 1;
      end
      id_14();
    join
  end
  module_0 modCall_1 (
      id_8,
      id_11,
      id_6,
      id_12,
      id_8,
      id_8,
      id_5,
      id_14,
      id_4,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
