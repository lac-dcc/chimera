// Seed: 2147607911
module module_0 (
    input wire id_0,
    input uwire id_1,
    input tri0 id_2,
    output logic id_3,
    input supply0 id_4,
    input wand id_5,
    input wire id_6,
    input tri1 id_7,
    input wire id_8,
    output wor id_9,
    input tri id_10,
    output uwire id_11,
    input wand id_12,
    input supply0 id_13,
    output wand id_14,
    output wand id_15
);
  wire id_17;
  wire id_18;
  timeunit 1ps;
  always @(posedge 1) begin
    id_3 <= 1'b0;
  end
endmodule
module module_0 (
    output logic id_0,
    output uwire id_1,
    input tri1 id_2,
    input supply0 id_3,
    input supply0 module_1,
    input logic id_5,
    output supply0 id_6,
    input tri1 id_7,
    input supply0 id_8,
    output logic id_9
);
  assign id_1 = id_7;
  wor id_11;
  wor id_12;
  always @(posedge 1)
    if (id_8 & id_11) id_0 <= 1;
    else id_9 <= 1;
  wire id_13;
  assign id_12 = id_11;
  supply0 id_14;
  module_0(
      id_8, id_7, id_8, id_0, id_8, id_8, id_7, id_7, id_3, id_6, id_3, id_1, id_2, id_8, id_6, id_1
  );
  assign id_0 = 1 ? id_7 > id_14 : id_5;
  wire id_15;
  assign id_1 = 1;
endmodule
