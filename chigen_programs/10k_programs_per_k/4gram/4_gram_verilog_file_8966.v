// Seed: 4251186597
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
    id_11
);
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  reg  id_12;
  wire id_13;
  always @(posedge (id_1))
    for (id_3 = 1'b0; 1; id_2 = id_4) begin
      id_12 <= id_8;
      if (1) begin
        if (id_5) cover (1'h0);
      end else if (1'b0) begin
        force id_9 = 1'b0;
      end else id_3 <= id_10;
    end
  initial id_2 = 1'b0;
  wire id_14;
  supply0 id_15 = 1;
  wire id_16;
  wire id_17;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    .id_12(id_6),
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always @(1 or posedge id_12) begin
    if (1) $display(id_4 && 1, id_8, 1, 1, id_10);
  end
  reg  id_13;
  wire id_14;
  module_0(
      id_12, id_4, id_13, id_7, id_14, id_12, id_6, id_8, id_4, id_10, id_14
  );
  wire id_15;
  always @(negedge id_4) id_13 <= id_10;
endmodule
