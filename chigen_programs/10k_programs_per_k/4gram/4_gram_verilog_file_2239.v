// Seed: 1976126610
module module_0 (
    input wire id_0,
    input tri1 id_1,
    input tri id_2,
    input uwire id_3,
    input wor id_4,
    output tri0 id_5,
    input tri0 id_6,
    input tri id_7
    , id_15,
    input uwire id_8,
    output supply1 id_9
    , id_16,
    output supply0 id_10,
    input supply1 id_11,
    output wor id_12,
    input supply0 id_13
);
  assign {1, 1, 1, 1, 1'b0} = 1 & {id_6 < id_15, 1} & 1 & id_15;
  wire id_17 = 1'b0;
  wire id_18;
endmodule
module module_0 (
    input supply1 id_0,
    output logic id_1,
    input tri1 id_2,
    output logic id_3,
    output supply1 id_4,
    input wand module_1,
    input tri id_6
);
  always_latch @(posedge id_0) begin
    if (1'h0)
      if (id_0) begin
        begin
          #1 begin
            $display(1, id_6, 1, 1);
            #1;
          end
          id_3 <= 1;
          id_1 <= 1'b0;
        end
        if (id_5)
          if (id_5 ^ 1) begin
            force id_3 = 1'd0;
          end
      end else id_3 <= 1'h0;
  end
  always @(posedge 1) begin
    wait (id_5);
    id_1 <= id_0 || 1;
    if ("") begin
      $display;
    end
  end
  module_0(
      id_2, id_0, id_2, id_6, id_0, id_4, id_6, id_6, id_2, id_4, id_4, id_0, id_4, id_0
  );
endmodule
