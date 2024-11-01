// Seed: 1369403711
module module_0 (
    input uwire id_0,
    input wand id_1,
    input tri1 id_2,
    output tri1 id_3,
    input wire id_4,
    input tri1 id_5,
    input supply1 id_6,
    output tri id_7,
    input wand id_8,
    input wor id_9,
    input tri1 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input tri0 id_13,
    input wand id_14,
    output wire id_15
);
  tri0 id_17 = id_9 ? 1'b0 : 1;
  wire id_18, id_19, id_20;
endmodule
module module_1 (
    output uwire id_0,
    input uwire id_1,
    input uwire id_2,
    input supply0 id_3,
    output uwire id_4,
    input supply0 id_5,
    input wand id_6,
    output wor id_7,
    output supply0 id_8,
    output uwire id_9,
    output supply0 id_10,
    input wire id_11,
    output tri1 id_12
);
  wire id_14;
  wor  id_15;
  module_0(
      id_6,
      id_11,
      id_11,
      id_4,
      id_2,
      id_2,
      id_2,
      id_4,
      id_1,
      id_5,
      id_1,
      id_2,
      id_3,
      id_6,
      id_2,
      id_7
  );
  assign id_7 = id_3 >= id_6;
  always @(posedge 1 or posedge 1) begin
    #1;
    wait (id_15);
  end
  wire id_16;
  wire id_17;
  wire id_18;
endmodule
