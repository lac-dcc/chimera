module prefix_carry_generator
# (
    parameter LEVELS = 3,
    parameter WIDTH  = 2 ** LEVELS
)
(
    input                      carry_in,
    input    [ WIDTH - 1 : 0 ] generate_in, propagate_in,
    output   [ WIDTH - 1 : 0 ] carry,
    output                     carry_out
);
    //Sklansky adder    
    wire [WIDTH : 0] g_temp [LEVELS : 0];
    wire [WIDTH : 0] p_temp [LEVELS : 0];
    
    assign g_temp[0] = {generate_in, carry_in};
    assign p_temp[0] = {propagate_in, carry_in};
    
    generate
        
        genvar i, j;
        
        for (i = 0; i <= LEVELS - 1; i = i + 1)
        begin : stage
            for (j = 0; j <= WIDTH; j = j + 1)
            begin : block
                if( (j / 2 ** i) % 2 == 1 )
                    gp_cell i_gp_cell
                    (
                        .g_left (g_temp[i][j]                        ),
                        .g_right(g_temp[i][(j / (2**i)) * (2**i) - 1]),
                        .p_left (p_temp[i][j]                        ),
                        .p_right(p_temp[i][(j / (2**i)) * (2**i) - 1]),
                        .g_out  (g_temp[i+1][j]                      ),
                        .p_out  (p_temp[i+1][j]                      )
                    );
                else
                begin
                    assign g_temp[i+1][j] = g_temp[i][j];
                    assign p_temp[i+1][j] = p_temp[i][j];
                end
            end
        end
    endgenerate
    
    assign carry = g_temp[LEVELS][WIDTH-1:0];
    assign carry_out = g_temp[LEVELS][WIDTH]|p_temp[LEVELS][WIDTH]&g_temp[LEVELS][WIDTH-1];
    

endmodule
