// Seed: 2410657548
module module_0 (
    output logic id_0,
    input  tri0  id_1
);
  reg
      id_3,
      id_4,
      id_5,
      id_6,
      id_7,
      id_8,
      id_9,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17;
  assign id_16 = id_14 > id_12;
  always id_0 <= id_10;
  wire id_18;
  always @(*)
  fork
    cover ({id_3, 1'b0, 1});
    if (id_17) begin
      #1;
      id_13 <= id_5 + 1'b0;
      id_13 <= ~id_16;
    end
  join_none
  assign id_7 = id_8;
endmodule
module module_1 (
    input  tri1  id_0,
    output logic id_1,
    output wor   id_2,
    input  logic id_3,
    output tri   id_4,
    input  tri0  id_5
);
  always @(posedge 'h0 or posedge 1) begin
    id_1 <= id_3;
  end
  module_0(
      id_1, id_0
  );
endmodule
