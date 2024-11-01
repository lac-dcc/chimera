// Seed: 1709494398
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
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always @(posedge (id_1)) id_5 = 1'b0;
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    input uwire id_2,
    output logic id_3,
    input wand id_4,
    input wand id_5,
    output uwire id_6,
    input logic id_7,
    output wire id_8,
    output uwire id_9,
    input supply1 id_10,
    input supply1 id_11,
    output tri0 id_12,
    input wor id_13,
    input supply1 id_14
);
  supply1 id_16 = 1;
  logic   id_17 = (id_7);
  always_latch @(posedge id_0) begin
    id_3 <= 1'h0;
    id_12 = 1;
    id_17 <= !id_11;
    fork
      disable id_18;
      #1 begin
        $display(1 == 1, 1);
      end
    join_none
  end
  assign id_16 = id_10;
  wire id_19;
  module_0(
      id_19, id_19, id_19, id_19, id_19, id_19, id_19, id_19, id_19, id_19
  );
  tri0 id_20 = id_11;
  wire id_21;
  wire id_22;
endmodule
