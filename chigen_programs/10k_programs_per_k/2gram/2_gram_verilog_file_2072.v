// Seed: 701000332
module module_0 (
    output tri1 id_0,
    output tri  id_1
);
endmodule
module module_1 (
    output wire id_0,
    output wor id_1,
    input supply0 id_2,
    input supply1 id_3,
    input wor id_4,
    input tri0 id_5,
    output uwire id_6,
    input wand id_7,
    input supply0 id_8,
    input supply1 id_9
);
  logic [7:0] id_11;
  module_0(
      id_0, id_6
  );
  initial id_11[1] = id_2;
  wire id_12;
endmodule
module module_2 (
    input  logic id_0,
    input  logic id_1,
    output tri1  id_2,
    output uwire id_3,
    input  wand  id_4,
    input  tri1  id_5,
    input  wand  id_6,
    input  logic id_7,
    input  wire  id_8
);
  reg id_10;
  module_0(
      id_3, id_2
  );
  logic id_11 = id_7;
  assign id_11 = {id_0, 1'd0 & id_4, 1'b0, id_1};
  task id_12;
    begin
      id_11 <= id_12[1];
    end
    id_10 = id_10;
  endtask
  always_latch
    if (id_7) id_10 <= 1;
    else begin
      @(posedge id_4 + 1'b0 or posedge id_5 + id_1, posedge 1);
    end
endmodule
