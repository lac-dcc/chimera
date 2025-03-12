// Seed: 2798265424
module module_0 (
    input supply0 id_0,
    output wand id_1,
    input tri0 id_2,
    input tri0 id_3
    , id_9,
    output supply0 id_4,
    input supply1 id_5,
    input tri0 id_6,
    output wand id_7
    , id_10
);
  wire module_0 = id_9;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output logic id_0,
    input uwire id_1,
    input uwire id_2,
    input wire id_3,
    input supply1 id_4,
    output uwire id_5,
    input supply0 id_6,
    output wire id_7,
    input tri1 id_8,
    input tri id_9,
    output supply1 id_10,
    input tri0 id_11,
    input wire id_12
);
  parameter id_14 = !1;
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_4,
      id_4,
      id_10,
      id_4,
      id_2,
      id_5
  );
  always @(posedge -1'b0) begin : LABEL_0
    if (id_14) begin : LABEL_1
      if (-1'b0) begin : LABEL_2
        return -1;
      end
    end else id_0 <= 1;
  end
endmodule
