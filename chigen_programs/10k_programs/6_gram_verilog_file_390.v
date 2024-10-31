// Seed: 135753405
module module_0 (
    output tri0 id_0,
    input wand id_1,
    input tri0 id_2,
    output uwire id_3,
    input wand id_4,
    output tri id_5,
    output tri1 id_6,
    input tri id_7,
    input wor id_8,
    input wor id_9,
    output supply0 id_10,
    input tri1 id_11,
    output supply1 id_12,
    output tri1 id_13,
    output wire id_14,
    output wor id_15,
    output tri1 id_16,
    output supply0 id_17,
    output tri1 id_18,
    output wor id_19
);
  wire id_21 = 1;
  integer id_22 (
      .id_0(1),
      .id_1(1'b0)
  );
endmodule
module module_1 (
    input  wor  id_0,
    input  wire id_1
    , id_4,
    output tri  id_2
);
  assign id_2 = id_0;
  wire  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ;
  module_0(
      id_2,
      id_1,
      id_0,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  wire id_21 = ~id_8, id_22, id_23;
  generate
    for (id_24 = id_19; 1; id_5 = id_4[1]) begin : id_25
      always @(!id_18 or posedge 1) begin
        assert (id_19#(.id_4(1))) $display(id_15, 1'b0);
      end
    end
  endgenerate
endmodule
