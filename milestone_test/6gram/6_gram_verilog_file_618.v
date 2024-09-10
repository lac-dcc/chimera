// Seed: 3435815343
`default_nettype id_1 `timescale 1ps / 1ps
module module_0 #(
    parameter id_2 = 32'd13
);
  logic _id_2;
  always @(posedge 1 or posedge id_2)
    if (id_1[0] - id_1) id_1 <= #1 id_1 - id_2;
    else if (id_2 | 1) begin
      if (1) id_2 <= id_1[1];
      else begin
        SystemTFIdentifier(id_1[1'b0]);
        if (1) begin
          if (1) begin
            id_1[1'b0 : 1'b0] <= 1 & id_2;
            if (1) begin
              if (id_1 <= id_2 && id_1) begin
                id_1 <= id_1;
              end else begin
                id_1 = id_2;
                id_1[id_2/1 : id_2] = id_1[!id_2];
              end
            end else if (1)
              if (id_1[1 : 1'b0]) id_2 <= (id_1);
              else id_2 <= "";
          end else begin
            id_2 <= id_1;
            id_2[id_2 : id_2] = !id_1;
            id_1 <= 1;
            id_1[1] <= ~id_2;
          end
        end else begin
          id_1 <= id_2;
        end
      end
    end
  initial begin
    id_1 <= id_2 - 1'd0;
    id_1 <= 1 - "" - 1;
  end
endmodule
