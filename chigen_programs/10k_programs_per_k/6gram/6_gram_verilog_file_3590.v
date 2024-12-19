// Seed: 3474771744
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
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  always
    if (id_2) begin : LABEL_0
      if (1) begin : LABEL_0
        id_4 = #id_13 1'b0;
      end
      id_10 <= 1'b0;
    end else begin : LABEL_0
      disable id_14;
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_8;
  initial begin : LABEL_0
    id_1 <= id_4 == 1'h0;
    id_7 <= #1 1;
    $display(1, id_7);
    id_5 = 1;
  end
  module_0 modCall_1 (
      id_8,
      id_5,
      id_5,
      id_7,
      id_5,
      id_5,
      id_8,
      id_4,
      id_8,
      id_7,
      id_4,
      id_8
  );
endmodule
