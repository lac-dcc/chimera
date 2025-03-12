// Seed: 162565798
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    input tri id_4,
    input wand id_5,
    input supply0 id_6
);
  logic id_8, id_9;
  localparam id_10 = -1;
  generate
    for (id_11 = 1; id_1; id_11 = 1) begin : LABEL_0
      for (id_12 = id_6; 1 == -1; id_11 = "") begin : LABEL_1
        assign id_9 = id_12;
      end
    end
  endgenerate
  assign id_8 = 1 ? id_11 : id_9 ? 1 : -1;
  logic id_13, id_14;
  wire id_15;
  assign id_14 = id_11++;
  wire id_16;
  wire id_17;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    output supply0 id_3,
    input tri id_4,
    output supply0 id_5,
    input tri0 id_6,
    output supply0 id_7,
    input wand id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_8,
      id_4,
      id_0,
      id_6
  );
  assign modCall_1.id_3 = 0;
  parameter id_11 = 1;
  assign id_5 = id_8;
  always @(id_2 or posedge -1 == 1 + 1'b0 && id_6) begin : LABEL_0
    assert (1 - -1 - id_1);
  end
  logic id_12;
  ;
endmodule
