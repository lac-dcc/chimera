// Seed: 1983581974
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output wand id_2,
    output tri id_3,
    input tri1 id_4,
    input wor id_5
    , id_9,
    input tri id_6,
    output supply1 id_7
);
  always @(posedge id_0 | 1) begin
    #id_10;
    begin : id_11
      assign id_3 = id_10;
    end
  end
endmodule
module module_1 (
    input wor id_0,
    output uwire id_1,
    input wor id_2,
    input uwire id_3,
    input uwire id_4,
    input uwire id_5,
    output supply0 id_6
);
  wire id_8;
  wire id_9, id_10;
  logic [7:0] id_11;
  always @(posedge id_0, posedge 1)
    if (id_3) id_11[1] = 1;
    else $display(1 == id_4);
  wire id_12;
  wire id_13;
  module_0(
      id_0, id_4, id_1, id_6, id_0, id_3, id_3, id_6
  );
endmodule
