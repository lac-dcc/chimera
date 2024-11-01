// Seed: 2144179304
module module_0;
  wire id_1;
endmodule
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input supply0 id_2,
    input wand id_3
    , id_15,
    output wand id_4,
    inout tri0 module_1,
    output tri0 id_6,
    output supply1 id_7,
    input uwire id_8,
    input uwire id_9,
    output wire id_10,
    input wand id_11,
    input tri0 id_12,
    output wor id_13
);
  wand id_16 = id_12;
  genvar id_17;
  module_0();
  wire id_18;
endmodule
module module_2 (
    output logic id_0,
    output tri0 id_1,
    output tri0 id_2,
    input tri id_3,
    output wor id_4,
    input wor id_5,
    input supply0 id_6,
    input uwire id_7,
    input wand id_8,
    output logic id_9,
    output wand id_10
);
  always @("" or posedge 1'b0 == 1) begin
    id_9 <= id_8 ^ id_5 == id_6;
    id_0 <= 1;
  end
  module_0(); id_12 :
  assert property (@(posedge 1'b0) id_12)
  else $display(id_3, id_12);
  wire id_13;
endmodule
