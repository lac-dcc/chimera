// Seed: 3931540467
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  wire id_3;
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
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  reg id_10;
  assign id_7 = 1;
  reg id_11;
  always @(1 or negedge id_8 - 1) begin : LABEL_0
    #1;
    id_7 = id_1;
    disable id_12;
    if (id_9) begin : LABEL_0
      id_1 <= id_11;
    end else begin : LABEL_0
      id_4 = id_6;
      id_10 <= id_12;
    end
    id_8 = 1'b0 - id_6 <-> id_1;
    wait (id_11);
  end
  supply1 id_13;
  assign id_5 = 1;
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_13
  );
  assign id_13 = 1 - 1;
endmodule
