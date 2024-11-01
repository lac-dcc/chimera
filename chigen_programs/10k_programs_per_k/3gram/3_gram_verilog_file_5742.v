// Seed: 1484885578
module module_0 (
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
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = 1;
  always @(negedge 1 or posedge 1)
    if (id_3) id_8 += 1;
    else begin
      #1 begin
        id_8 <= 1;
        ;
        id_8 <= 1;
      end
    end
  wire id_10;
  wire id_11;
endmodule
macromodule module_1 (
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
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always_latch @(id_2, posedge 1) begin
    if (id_3) begin
      id_11 = 1;
    end
  end
  assign id_5 = id_11;
  wire id_13;
  reg  id_14 = id_3;
  wire id_15;
  always_latch @(1 or posedge 1'b0) id_3 <= 1;
  assign id_12 = id_13;
  module_0(
      id_1, id_6, id_4, id_4, id_4, id_4, id_7, id_3, id_4
  );
  wire id_16;
endmodule
