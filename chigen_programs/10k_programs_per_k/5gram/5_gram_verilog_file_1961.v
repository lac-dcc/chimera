// Seed: 3906779744
module module_0 (
    input wor id_0,
    input wor id_1,
    output supply1 id_2,
    output supply1 id_3,
    input wire id_4,
    input tri1 id_5,
    input uwire id_6,
    input supply1 id_7,
    input tri0 id_8,
    input wor id_9,
    input tri id_10,
    input supply1 id_11
);
  task id_13;
    begin
      deassign id_2;
      forever if (id_10) id_13 <= id_1 + 1;
    end
  endtask
endmodule
module module_1 (
    input  wire  id_0,
    input  uwire id_1,
    input  tri   id_2,
    output tri   id_3,
    input  wand  id_4,
    input  wire  id_5,
    output tri1  id_6,
    output logic id_7,
    output wor   id_8,
    input  wor   id_9
);
  wire id_11;
  always_latch @(posedge 1'b0 < 1'b0) id_7 <= 1;
  tri id_12 = 1;
  module_0(
      id_5, id_4, id_8, id_8, id_1, id_5, id_5, id_9, id_1, id_0, id_0, id_1
  );
  assign id_7 = !id_0;
endmodule
