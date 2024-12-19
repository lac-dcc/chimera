// Seed: 253414519
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  initial id_4 = 1'b0;
  wire id_8;
  wire id_9;
  assign id_8 = id_1;
  assign module_1.id_0 = 0;
  assign id_4 = id_2;
  wire id_10;
endmodule
module module_1 (
    output supply1 id_0,
    output logic   id_1,
    output logic   id_2,
    input  logic   id_3,
    output logic   id_4,
    inout  logic   id_5
);
  assign id_2 = id_3;
  always_latch #1 begin : LABEL_0
    id_1 <= id_3;
    id_5 <= (1'd0);
    #id_7 begin : LABEL_0
      id_4 <= 1;
      if ("" & 1) id_4 <= id_7 * (id_7);
      id_5 = 1'b0;
    end
    id_2 = 1;
    assert (1 + id_3);
    id_1 <= 1'b0;
  end
  logic id_8;
  assign id_5 = id_8;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7
  );
endmodule
