// Seed: 2022631311
module module_0 (
    input wor id_0,
    input wand id_1,
    input tri0 id_2,
    output wand id_3,
    output wire id_4,
    output uwire id_5,
    input uwire id_6,
    output supply0 id_7,
    output uwire id_8,
    output supply1 id_9
);
  assign id_7 = 1;
  wire id_11;
  wire id_12;
  wire id_13;
  always_latch #1 begin
    assume #1  (1'b0)
    else;
  end
endmodule
module module_1 (
    output supply0 id_0,
    output logic id_1,
    input wor id_2,
    input wand id_3,
    input supply1 id_4,
    output tri1 id_5,
    input uwire id_6
);
  always @(posedge id_4 - 1)
    if (1)
      if (id_6) begin
        id_1 <= 1;
        #(id_3) id_1 = 1'h0;
        $display();
      end else
        assume (1'h0 - 1)
        else;
  module_0(
      id_3, id_2, id_6, id_0, id_5, id_0, id_6, id_0, id_0, id_5
  );
endmodule
