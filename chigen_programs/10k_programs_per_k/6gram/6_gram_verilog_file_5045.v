// Seed: 2957920472
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    input uwire id_2,
    output supply1 id_3,
    output supply1 id_4,
    input tri1 id_5,
    output supply0 id_6
);
  wire id_8;
  wire id_9;
  id_10(
      .id_0(1), .id_1(1)
  ); id_11(
      .id_0(1), .id_1(1)
  );
endmodule
module module_1 (
    output logic id_0,
    output uwire id_1,
    input uwire id_2,
    output tri0 id_3,
    input logic id_4,
    input wire id_5,
    output wand id_6,
    output supply1 id_7
);
  reg  id_9;
  wire id_10;
  wire id_11;
  reg  id_12;
  reg  id_13;
  assign id_12 = id_9;
  assign id_9  = id_9;
  logic id_14;
  module_0(
      id_2, id_3, id_5, id_6, id_7, id_5, id_3
  );
  always @(1 or id_13, posedge id_9 or posedge "" == 1) begin
    id_14 = id_4;
    case (1)
      1: id_6 = 1;
      1'b0: id_0 <= id_14;
      default: ;
    endcase
  end
  always @(id_4)
    #1
      if (1) id_7 = 1;
      else begin
        id_14 <= 1;
      end
  assign id_14 = 1;
  reg id_15;
  always @(posedge 1) forever id_15 <= id_12;
endmodule
