// Seed: 2549104806
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always_comb @(posedge id_4);
endmodule
module module_1 #(
    parameter id_22 = 32'd68
) (
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  inout logic [7:0] id_16;
  output reg id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_2,
      id_5
  );
  inout uwire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout supply0 id_6;
  input wire id_5;
  output reg id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  id_17 :
  assert property (@(negedge id_16) id_13)
  else begin : LABEL_0
    id_4 <= ({-1'b0, id_1});
  end
  logic id_18;
  assign id_11 = id_6;
  parameter id_19 = 1;
  always @(negedge id_8) disable id_20;
  assign id_6 = (id_1) & -1;
  always @(posedge 1 * -1) id_15 <= -1;
  int id_21;
  assign id_7 = id_11++;
  task _id_22;
    begin : LABEL_1
      wait (id_6);
    end
  endtask
  integer id_23;
  wire id_24;
  wire id_25;
  ;
  assign id_11 = -1;
  always @(*) id_4 = id_16[id_22] == id_19;
endmodule
