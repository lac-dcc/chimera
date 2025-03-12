// Seed: 2868385025
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
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_11;
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
    id_9,
    id_10
);
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_8,
      id_6,
      id_6,
      id_6,
      id_7,
      id_10,
      id_10,
      id_3
  );
  inout wire id_6;
  output reg id_5;
  inout supply1 id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  for (id_11 = ~id_10; {id_9{1}}; id_5 = 1) begin : LABEL_0
    for (id_12 = id_8; 1'b0; id_4 += 1) begin : LABEL_1
      for (id_13 = id_13 / id_9 == id_12; -1; id_13 = id_12) begin : LABEL_2
        assign id_5 = 1'h0;
      end
      assign id_3 = id_11;
    end
    assign id_4 = -1;
  end
  wire id_14 = id_10;
endmodule
