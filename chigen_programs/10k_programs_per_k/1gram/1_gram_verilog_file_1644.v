// Seed: 250767817
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    output tri1 id_2
    , id_4
);
  assign id_4 = 1 & id_0;
  initial disable id_5;
  assign id_5 = 1'h0;
  wire id_6, id_7, id_8, id_9, id_10;
endmodule
module module_1 (
    input tri id_0,
    input supply0 id_1,
    output wor id_2,
    output logic id_3,
    input wand id_4,
    inout supply1 id_5,
    input wire id_6,
    inout logic id_7,
    output wand id_8,
    output tri0 id_9,
    output supply1 id_10
);
  supply0 id_12, id_13, id_14;
  always_latch id_7 <= 1;
  always @(posedge id_0) begin
    if (id_7) @(posedge 1 + id_0.id_1 or posedge 1) wait (1);
    begin
      if (((id_13) & id_6)) begin
        $display(-id_7, !1, 1 << id_13);
      end
      if (1) id_9 = id_4;
      else begin
        id_3 <= 1;
      end
    end
  end
  wire id_15;
  assign id_7 = {id_4 == id_1};
  wire id_16;
  assign id_12 = 1;
  id_17(
      id_15
  ); module_0(
      id_6, id_5, id_2
  );
endmodule
