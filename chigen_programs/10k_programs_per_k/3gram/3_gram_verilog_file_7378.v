// Seed: 3762589488
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  id_9 :
  assert property (@(posedge 1 != 1) 1)
  else begin
    $display(1);
  end
  wire id_10;
endmodule
module module_1 (
    output wire id_0,
    input wire id_1,
    input tri1 id_2,
    input supply1 id_3,
    input tri1 id_4,
    input tri id_5,
    input logic id_6,
    input supply1 id_7
);
  wire id_9;
  wire id_10;
  assign id_0 = 1'd0;
  nand (id_0, id_15, id_16, id_13, id_6, id_14, id_7, id_2, id_11, id_10, id_1);
  wire id_11;
  function id_12 id_13;
    input id_14;
    input id_15;
    input id_16;
    begin
      disable id_17;
      id_17 = id_6;
    end
  endfunction
  module_0(
      id_9, id_10, id_10, id_10, id_9, id_11, id_11, id_9
  );
  always @(posedge ~id_6 or posedge id_9) id_15 <= 1;
  wire id_18;
endmodule
