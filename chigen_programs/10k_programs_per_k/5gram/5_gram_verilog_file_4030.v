// Seed: 2560016693
module module_0 (
    input supply0 id_0,
    output tri id_1,
    output tri0 id_2,
    output wand id_3,
    input wire id_4,
    output wire id_5,
    input wire id_6,
    input tri1 id_7,
    output tri0 id_8,
    input wire id_9,
    output supply1 id_10,
    output uwire id_11,
    input wand id_12,
    input tri0 id_13,
    input supply1 id_14,
    output tri0 id_15
);
  assign id_10 = id_9;
  id_17(
      .id_0(1), .id_1(id_12), .id_2(1), .id_3(id_7), .find(1'b0), .id_4(id_7), .id_5(id_7), .id_6(1)
  );
  wire id_18;
  genvar id_19;
endmodule
module module_1 (
    output tri0 id_0,
    output supply1 id_1,
    input wire id_2,
    input logic id_3,
    output logic id_4,
    input uwire id_5
);
  initial begin
    id_4 <= id_3 == id_2;
    #1;
    deassign id_4;
    id_4 <= 1;
  end
  wire id_7;
  assign id_4 = id_3;
  module_0(
      id_5, id_1, id_0, id_0, id_5, id_0, id_5, id_5, id_0, id_5, id_0, id_1, id_2, id_2, id_2, id_1
  );
endmodule
