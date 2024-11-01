// Seed: 2587233640
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri id_3,
    input tri1 id_4,
    input tri0 id_5,
    input tri id_6,
    input wire id_7,
    input wand id_8,
    input tri0 id_9
);
  wand id_11, id_12;
  wire id_13;
  wire id_14;
  wire id_15;
  wire id_16;
  wire id_17;
  assign id_11 = id_8;
  wor id_18 = 1;
  wire id_19, id_20, id_21;
  always @(posedge 1) begin
    $display(1, -id_3);
    if (id_8 == 1) begin
      assume ((1))
      else;
    end
  end
endmodule
module module_1 (
    output wor id_0,
    output supply0 id_1,
    input tri0 id_2,
    output wire id_3
);
  generate
    for (id_5 = ~id_2; id_5; id_3 = id_5[1]) begin : id_6
      assign id_3 = 1;
    end
  endgenerate
  module_0(
      id_2, id_2, id_2, id_2, id_2, id_2, id_2, id_2, id_2, id_2
  );
endmodule
