// Seed: 618726557
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_11;
endmodule
module module_1 #(
    parameter id_10 = 32'd37,
    parameter id_9  = 32'd35
) (
    output supply1 id_0,
    input tri0 id_1,
    input tri1 id_2
);
  assign id_0 = 1'h0 ? id_2 : 1;
  assign id_0 = 1 ? (1 ? 1 : id_2) !== 1'b0 : 1;
  wand id_4;
  id_5(
      .id_0(1'b0), .id_1(1)
  ); id_6 :
  assert property (@(posedge 1 - id_4) ~1'b0)
  else $display(1);
  wire id_7;
  assign id_0 = 1 / id_6;
  wire id_8;
  assign id_6 = 1;
  defparam id_9.id_10 = 1'd0; module_0(
      id_7, id_6, id_8, id_7, id_6, id_6, id_7, id_6, id_8, id_7
  );
  wire id_11;
  assign id_4 = id_2;
endmodule
