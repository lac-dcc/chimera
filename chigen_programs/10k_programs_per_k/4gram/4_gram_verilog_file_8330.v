// Seed: 4217381043
module module_0;
  always #1 begin
    id_1 <= 1;
    if (id_1(id_1)) begin
      id_1 <= 1 & 1;
    end
  end
  assign id_2 = 1;
endmodule
module module_1 (
    output logic id_0
    , id_15,
    input wor id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply0 id_4,
    input tri0 id_5,
    input wand id_6,
    input wire id_7,
    input tri id_8,
    output wire id_9,
    input wire id_10,
    input supply1 id_11,
    input supply1 id_12,
    input supply1 id_13
);
  always @* begin
    if (1'b0) id_9 = 1'd0;
    else id_0 <= id_6 - 1;
  end
  id_16 :
  assert property (@(negedge 1'd0) {id_1{1}})
  else $display(id_15);
  module_0();
  assign id_15 = 1'b0 & 1 & id_16;
  assign id_9  = (id_15);
endmodule
