// Seed: 3147613025
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    input supply0 id_2,
    input tri id_3,
    output supply1 id_4,
    input tri0 id_5,
    input tri1 id_6
    , id_10,
    output wand id_7,
    output wand id_8
);
  assign id_7 = 1'd0 ? 1 : 1;
endmodule
module module_1 #(
    parameter id_8 = 32'd0,
    parameter id_9 = 32'd38
) (
    output supply1 id_0,
    input tri1 id_1,
    output logic id_2,
    input supply1 id_3,
    output uwire id_4,
    output wand id_5
);
  always @(1 or posedge 1) begin
    $display(id_3);
    if (id_3) id_2 <= 1;
  end
  wire id_7;
  always @(1 or posedge (1)) #1;
  defparam id_8.id_9 = ""; module_0(
      id_3, id_5, id_1, id_3, id_5, id_3, id_3, id_0, id_0
  );
endmodule
